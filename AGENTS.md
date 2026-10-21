# forts-replay-corpus

Replay files (`.fwr`) of the game Forts, used as test data by [forts-replay](https://github.com/an0nfunc/forts-replay), which pins this repository as the submodule `testdata/corpus`.

## Layout

- `vX.Y.Z/` (or `vX.Y` when the patch is unknown): the replays of one game version, with `INDEX.md` listing each file, its kind (basic, edge case, breaks fwr) and what happens in it.
- `scripts/check.sh`: the layout check CI runs.

## Rules

- A replay goes in the folder of the game version that wrote it, under a short lowercase name with dashes, with a row in that folder's `INDEX.md`. `scripts/check.sh` enforces this.
- A pull request runs its own copy of `scripts/check.sh` and the workflow, so one that changes `scripts/`, `.github/` or anything besides replays and `INDEX.md` rows gets a careful read.
- Basic replays: a small set per version. Edge cases and replays that break `fwr` are what the corpus is for.
- Each file stays under 20 MB, in plain git without Git LFS. Replays stay as the game wrote them, without edits.
- Before adding a replay, scan its decompressed blocks and header (`fwr extract`) for anything other than game state: local file paths, account names, or chat the players did not expect to be published.
- The repository holds replays and their index only, no other game files or data.
- Removal on request: a replay someone who played in it asks to remove is deleted from the whole history with `git filter-repo`; main's protection is lifted for the force push and restored after it. Then a GitHub Support ticket asks to dereference the pull requests that hold the file and purge cached views, naming the repository, those pull requests and the first changed commits `git filter-repo` prints. A replay attached to an issue goes with the comment that attached it. forts-replay then bumps the submodule and its golden file.
- After a change here, forts-replay bumps `testdata/corpus` and regenerates `testdata/corpus.golden` in the same pull request.
- Commits: short conventional subject (`feat(v1.38.2): ...`, `docs: ...`), a body only when it adds something.
