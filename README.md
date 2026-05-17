# `kicad`

[![ci](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml/badge.svg)](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml)

Custom KiCad libraries, plugins, scripts, etc.

## Usage

### Global Library (Recommended)

Start by cloning the repository to your local filesystem:

```shell
mkdir -p ~/.local/share/kicad/lib
git clone git@github.com:loozhengyuan/kicad ~/.local/share/kicad/lib/loozhengyuan
```

Next, set the `CUSTOM_LIBRARY_DIR` variable via `Preferences` → `Configure Paths...`:

| Name                 | Path                                    |
| -------------------- | --------------------------------------- |
| `CUSTOM_LIBRARY_DIR` | `~/.local/share/kicad/lib/loozhengyuan` |

Add the symbol library table via `Preferences` → `Manage Symbol Libraries...`:

| Enable | Show | Nickname       | Library Path                                      | Library Format | Options | Description |
| ------ | ---- | -------------- | ------------------------------------------------- | -------------- | ------- | ----------- |
| ✅     | ✅   | `loozhengyuan` | `${CUSTOM_LIBRARY_DIR}/lib/symbols/sym-lib-table` | Table          |         |             |

Add the footprint library table via `Preferences` → `Manage Footprint Libraries...`:

| Enable | Show | Nickname       | Library Path                                        | Library Format | Options | Description |
| ------ | ---- | -------------- | --------------------------------------------------- | -------------- | ------- | ----------- |
| ✅     | ✅   | `loozhengyuan` | `${CUSTOM_LIBRARY_DIR}/lib/footprints/fp-lib-table` | Table          |         |             |

## Development

### Major Version Upgrade

To upgrade symbols to the latest KiCad version format:

```shell
kicad-cli sym upgrade ./lib/symbols/*.kicad_symdir
```

To upgrade footprints to the latest KiCad version format:

```shell
kicad-cli fp upgrade ./lib/footprints/*.pretty
```

You may also need to manually update the `*_3DMODEL_DIR` variable to pass CI checks:

```shell
sed -i 's/\${KICAD8_3DMODEL_DIR}/\${KICAD9_3DMODEL_DIR}/g' ./lib/**/*.kicad_mod
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
