#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# usage: init.sh path
{ set -x; cd "$1" || exit; { set +x; } 2>/dev/null; }

# pylint.yml
[ -e setup.py ] && [[ -n $(find . -type f -name "*.py" ! -name setup.py) ]] && {
  ( set -x; /opt/homebrew/bin/rsync --mkpath "${BASH_SOURCE[0]%/*/*}"/workflows/pylint.yml "$PWD"/.github/workflows/pylint.yml ) || exit
}
# pytest.yml
[ -e setup.py ] && [ -e tests ] && [[ -n $(find tests -type f ! -iname ".*") ]] && {
  ( set -x; /opt/homebrew/bin/rsync --mkpath "${BASH_SOURCE[0]%/*/*}"/workflows/pytest.yml "$PWD"/.github/workflows/pytest.yml ) || exit
};:
