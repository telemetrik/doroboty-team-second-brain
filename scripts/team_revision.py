"""Resolve the observed origin HEAD without changing the working tree."""
import argparse
import json
import os
from pathlib import Path
import re
import subprocess


def git(repo, *args):
    try:
        result = subprocess.run(
            ["git", "-C", str(repo), *args],
            capture_output=True,
            text=True,
            check=True,
            env={**os.environ, "GIT_TERMINAL_PROMPT": "0"},
            timeout=30,
        )
    except (OSError, subprocess.SubprocessError):
        return None
    return result.stdout.strip()


def revision(repo):
    root = git(repo, "rev-parse", "--show-toplevel")
    if not root or Path(root).resolve() != repo:
        return {"status": "unavailable", "reason": "not_clone_root"}
    if not git(repo, "remote", "get-url", "origin"):
        return {"status": "unavailable", "reason": "no_origin"}

    advertised = git(repo, "ls-remote", "--symref", "origin", "HEAD") or ""
    branch = re.search(r"^ref: (refs/heads/[^\s]+)\s+HEAD$", advertised, re.MULTILINE)
    head = re.search(r"^([0-9a-f]{40}|[0-9a-f]{64})\s+HEAD$", advertised, re.MULTILINE)
    reason = "origin_head_not_verified"
    if branch and head:
        sha = head[1]
        if git(repo, "cat-file", "-e", f"{sha}^{{commit}}") is None:
            git(repo, "fetch", "--no-write-fetch-head", "--no-tags",
                "--no-recurse-submodules", "--no-auto-maintenance", "origin", sha)
        if git(repo, "cat-file", "-e", f"{sha}^{{commit}}") is not None:
            return {"status": "verified", "ref": branch[1], "sha": sha}
        reason = "commit_unavailable"

    cached_ref = git(repo, "symbolic-ref", "--quiet", "refs/remotes/origin/HEAD")
    if cached_ref and cached_ref.startswith("refs/remotes/origin/"):
        cached_sha = git(repo, "rev-parse", "--verify", f"{cached_ref}^{{commit}}")
        if cached_sha:
            return {"status": "cached", "ref": cached_ref, "sha": cached_sha, "reason": reason}
    return {"status": "unavailable", "reason": reason}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("clone", type=Path)
    args = parser.parse_args()
    result = revision(args.clone.resolve())
    print(json.dumps(result))
    return int(result["status"] == "unavailable")


if __name__ == "__main__":
    raise SystemExit(main())
