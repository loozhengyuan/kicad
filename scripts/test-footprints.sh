#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

script_dir="$(dirname "${BASH_SOURCE[0]}")"
script_name="$(basename "${BASH_SOURCE[0]}")"

klc_command="klc-footprint"

if ! command -v "${klc_command}"; then
    echo "error: \`${klc_command}\` command not found, ensure \`kicad-library-utils\` is installed and added to PATH" >&2
    exit 1
fi

# NOTE: The command returns an exit code of 2 if there are warnings,
# but we do not want to fail the CI job if there are warnings.
# NOTE: Ignoring F9.3 due to issues complying as a third-party library.
"${klc_command}" \
    -vv \
    --exclude F9.3 \
    ./lib/footprints/_Custom.pretty/*.kicad_mod \
    || [ "${?}" -eq 2 ]
