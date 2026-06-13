#!/usr/bin/env bash
# Cut a new Tablething release: bump from the latest published version and
# create the matching tag here, which triggers the signed build + publish.
set -euo pipefail

BUMP="${1:?usage: scripts/release.sh patch|minor|major}"
REPO="tablething/tablething"

CUR=$(gh api "repos/$REPO/releases/latest" -q .tag_name 2>/dev/null || echo "v0.0.0")
CUR="${CUR#v}"

NEW=$(python3 - "$CUR" "$BUMP" <<'PY'
import sys
cur, bump = sys.argv[1], sys.argv[2]
maj, mn, pa = (int(x) for x in (cur.split(".") + ["0", "0", "0"])[:3])
if bump == "major": maj, mn, pa = maj + 1, 0, 0
elif bump == "minor": mn, pa = mn + 1, 0
elif bump == "patch": pa = pa + 1
else: sys.exit("bump must be patch, minor, or major")
print(f"{maj}.{mn}.{pa}")
PY
)

echo "Releasing v$NEW (was v$CUR)"
SHA=$(gh api "repos/$REPO/git/ref/heads/main" -q .object.sha)
gh api -X POST "repos/$REPO/git/refs" -f "ref=refs/tags/v$NEW" -f "sha=$SHA" >/dev/null
echo "Tagged v$NEW"
echo "Build: https://github.com/$REPO/actions"
