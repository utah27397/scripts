# DFHack Scripts Backport for 0.47.05-r8

This branch contains a minimized set of scripts from the DFHack develop-era
scripts repository, patched for use with DFHack `0.47.05-r8`.

- Source basis: DFHack `scripts` commit `8d0d0331487da879e25e4f4530ddf761cf4310eb`
- Target DFHack release: `0.47.05-r8`
- Selected files: `manifests/backport-scripts.txt`

The branch intentionally excludes upstream docs, tests, CI, and unrelated
scripts. The compatibility edits are already applied in-tree; the package build
does not clone another source or apply patch files.

Build the selected tree:

```sh
make build
```

The generated scripts are written under `build/scripts/`, preserving their
relative paths.

Install into a staging root:

```sh
make install DESTDIR=/tmp/dfhack-backport-root PREFIX=hack/scripts
```

Applied 0.47.05 compatibility mappings:

- `df.global.plotinfo.civ_id` -> `df.global.ui.civ_id`
- `df.global.plotinfo.burrows` -> `df.global.ui.burrows`
- `df.global.plotinfo.main.hotkeys` -> `df.global.ui.main.hotkeys`
- `df.global.plotinfo.hauling.routes` -> `df.global.ui.hauling.routes`
- `df.global.plotinfo.flags.recheck_aid_requests` -> `df.global.ui.flags.recheck_aid_requests`
