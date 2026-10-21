#!/usr/bin/env bash
# Checks the corpus layout: every replay sits in a version folder, is small
# enough, has a plain name and a row in its folder's INDEX.md, and every row
# names a replay that exists.
set -euo pipefail
cd "$(dirname "$0")/.."

max=$((20 * 1024 * 1024))
status=0
fail() {
	echo "$*" >&2
	status=1
}

while IFS= read -r -d '' f; do
	f=${f#./}
	dir=${f%/*}
	name=${f##*/}
	if [[ $f != */* || ! $dir =~ ^v[0-9]+\.[0-9]+(\.[0-9]+)?$ ]]; then
		fail "$f: not directly in a version folder such as v1.38.2"
		continue
	fi
	[[ $name =~ ^[a-z0-9][a-z0-9-]*\.fwr$ ]] || fail "$f: name must be lowercase letters, digits and dashes"
	(($(stat -c %s "$f") <= max)) || fail "$f: larger than 20 MB"
	grep -qF "| \`$name\` |" "$dir/INDEX.md" 2>/dev/null || fail "$f: no row in $dir/INDEX.md"
done < <(find . -path ./.git -prune -o -type f -iname '*.fwr' -print0)

for index in v*/INDEX.md; do
	dir=${index%/*}
	while IFS= read -r name; do
		[[ -f $dir/$name ]] || fail "$index: $name does not exist"
	done < <(sed -n 's/^| `\([^`]*\.fwr\)` |.*/\1/p' "$index")
done

exit $status
