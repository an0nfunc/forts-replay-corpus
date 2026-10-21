#!/usr/bin/env bash
# Checks the corpus layout: every replay sits in a version folder, is small
# enough, has a plain name and a row in its folder's INDEX.md, and every row
# names a replay that exists.
set -euo pipefail
shopt -s nullglob
cd "$(dirname "$0")/.."

max=$((20 * 1024 * 1024))
name_re='^[a-z0-9][a-z0-9-]*\.fwr$'
status=0
fail() {
	echo "$*" >&2
	status=1
}
# rows prints the file name of each row of an INDEX.md.
rows() {
	sed -n 's/^| `\([^`]*\)` |.*/\1/p' "$1" 2>/dev/null || true
}

while IFS= read -r -d '' f; do
	f=${f#./}
	dir=${f%/*}
	name=${f##*/}
	if [[ $f != */* || ! $dir =~ ^v[0-9]+\.[0-9]+(\.[0-9]+)?$ ]]; then
		fail "$f: not directly in a version folder such as v1.38.2"
		continue
	fi
	[[ $name =~ $name_re ]] || fail "$f: name must be lowercase letters, digits and dashes"
	(($(stat -c %s "$f") <= max)) || fail "$f: larger than 20 MB"
	grep -qxF -- "$name" <<<"$(rows "$dir/INDEX.md")" || fail "$f: no row in $dir/INDEX.md"
done < <(find . -path ./.git -prune -o -type f -iname '*.fwr' -print0)

for index in v*/INDEX.md; do
	dir=${index%/*}
	while IFS= read -r name; do
		if [[ ! $name =~ $name_re ]]; then
			fail "$index: $name is not a replay file name"
		elif [[ ! -f $dir/$name ]]; then
			fail "$index: $name does not exist"
		fi
	done < <(rows "$index")
done

exit $status
