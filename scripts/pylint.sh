#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# pylint.yml

! [ -e setup.py ] && echo "SKIP: $PWD/setup.py NOT EXISTS" && exit
[[ -z $(find . -type f -name "*.py" ! -name setup.py) ]] && echo "SKIP" && exit
[[ "${PWD##*/}" == django* ]] && echo "SKIP: django" && exit

( set -x; /opt/homebrew/bin/rsync --mkpath "${BASH_SOURCE[0]%/*/*}"/workflows/pylint.yml "$PWD"/.github/workflows/pylint.yml ) || exit
