#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# pytest.yml

! [ -e setup.py ] && echo "SKIP: $PWD/setup.py NOT EXISTS" && exit
[ -e tests ] && echo "SKIP: ./tests NOT EXISTS" && exit
[[ -z $(find tests -type f ! -iname ".*") ]] && echo "SKIP: ./tests empty" && exit

( set -x; /opt/homebrew/bin/rsync --mkpath "${BASH_SOURCE[0]%/*/*}"/workflows/pytest.yml "$PWD"/.github/workflows/pytest.yml ) || exit
