#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

script_dir="$(dirname "${BASH_SOURCE[0]}")"
script_name="$(basename "${BASH_SOURCE[0]}")"

klc_command="klc-symbol"

if ! command -v "${klc_command}"; then
    echo "error: \`${klc_command}\` command not found, ensure \`kicad-library-utils\` is installed and added to PATH" >&2
    exit 1
fi

# NOTE: The command returns an exit code of 2 if there are warnings,
# but we do not want to fail the CI job if there are warnings.
# FIXME: Ignoring S4.5 due to upstream KLC utils bug
# https://gitlab.com/kicad/libraries/kicad-library-utils/-/work_items/436
"${klc_command}" \
    -vv \
    --exclude 'S4.5' \
    --multiprocess "$(nproc)" \
    --footprints ./lib/footprints/ \
    ./lib/symbols/_Custom.kicad_symdir/*.kicad_sym \
    || [ "${?}" -eq 2 ]
