# forts-replay-corpus

[![check](https://github.com/an0nfunc/forts-replay-corpus/actions/workflows/check.yml/badge.svg)](https://github.com/an0nfunc/forts-replay-corpus/actions/workflows/check.yml)

Replay files (`.fwr`) from [Forts](https://www.earthworkgames.com/forts/) for testing replay parsers. [forts-replay](https://github.com/an0nfunc/forts-replay) runs its tests against every file here.

## Layout

There is one folder per game version, because each update can change the format. Each folder has an `INDEX.md` that lists its replays, what happens in each one, and why it's here:

- **basic**: everyday actions like building, firing and upgrading. A small set per version is enough.
- **edge case**: something the game records in an unusual way, or doesn't record at all.
- **breaks fwr**: a replay that exposed a bug in `fwr`.

| Folder | Header version | Replays |
|---|---|---|
| [v1.39.0](v1.39.0/INDEX.md) | 1390 | single-player games on Abyss, repeating v1.38.2 ones |
| [v1.38.2](v1.38.2/INDEX.md) | 1383 | single-player games on Abyss and Bombard |
| [v1.33](v1.33/INDEX.md) | 1331 | three games from October 2025 |

## Adding a replay

Replays from other game versions are welcome, even short ones, and so are replays that make `fwr` warn or fail. Open a pull request that adds the file to its version folder and a row to that folder's `INDEX.md`. If you'd rather not, open an issue and attach the replay as a zip (GitHub doesn't accept `.fwr` attachments).

Either way, tell us:

- the game version. Newer replays start their file name with it, as in `v1.38.2_Abyss_20261018_032458.fwr`.
- what happens in the replay, or what `fwr info` prints for it.

Keep each file under 20 MB. Once merged, a replay is public, including the player names and SteamIDs in it.

## Removal

If you played in one of these replays and want it gone, open an issue naming the file. You don't have to give a reason. We delete the file from this repository's whole history, not just the latest commit, and ask GitHub to remove the copies it keeps in pull requests and cached pages. Copies in forks or clones other people made are outside our reach.

## Legal

The replays are files the game wrote. Forts is a trademark of EarthWork Games. This project is not affiliated with or endorsed by EarthWork Games.
