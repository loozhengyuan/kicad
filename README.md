# `kicad`

[![ci](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml/badge.svg)](https://github.com/loozhengyuan/kicad/actions/workflows/ci.yml)

Custom KiCad libraries, plugins, scripts, etc.

## Development

### Major Version Upgrade

To upgrade symbols to the latest KiCad version format:

```shell
kicad-cli sym upgrade ./lib/symbols/*.kicad_sym
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
