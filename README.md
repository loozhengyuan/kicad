# `kicad`

[![ci](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml/badge.svg)](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml)

Custom KiCad libraries, plugins, scripts, etc.

## Usage

Using it as a **Project Specific Library** is the recommended workflow because it allows you to pin to the exact library version when installed as a Git submodule.

Start by adding this repository as a Git submodule to your repository path (we assume `./hardware` is the KiCad project directory):

```shell
git submodule add git@github.com:loozhengyuan/kicad ./hardware/lib
```

Add the symbol library table via `Preferences` → `Manage Symbol Libraries...` under the `Project Specific Libraries` tab:

| Enable | Show | Nickname | Library Path                            | Library Format | Options | Description |
| ------ | ---- | -------- | --------------------------------------- | -------------- | ------- | ----------- |
| ✅     | ✅   | `ZY`     | `${KIPRJMOD}/lib/symbols/sym-lib-table` | Table          |         |             |

Add the footprint library table via `Preferences` → `Manage Footprint Libraries...` under the `Project Specific Libraries` tab:

| Enable | Nickname | Library Path                              | Library Format | Options | Description |
| ------ | -------- | ----------------------------------------- | -------------- | ------- | ----------- |
| ✅     | `ZY`     | `${KIPRJMOD}/lib/footprints/fp-lib-table` | Table          |         |             |

## Development

### Major Version Upgrade

To upgrade symbols to the latest KiCad version format:

```shell
kicad-cli sym upgrade ./symbols/*.kicad_symdir
```

To upgrade footprints to the latest KiCad version format:

```shell
kicad-cli fp upgrade ./footprints/*.pretty
```

You may also need to manually update the `*_3DMODEL_DIR` variable to pass CI checks:

```shell
sed -i 's/\${KICAD8_3DMODEL_DIR}/\${KICAD9_3DMODEL_DIR}/g' ./footprints/**/*.kicad_mod
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
