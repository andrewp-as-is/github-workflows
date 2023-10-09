#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# pylint-django.yml

! [ -e setup.py ] && echo "SKIP: $PWD/setup.py NOT EXISTS" && exit
[[ -z $(find . -type f -name "*.py" ! -name setup.py) ]] && echo "SKIP: no python files" && exit
[[ "${PWD##*/}" != django* ]] && echo "SKIP: not django" && exit

( set -x; /opt/homebrew/bin/rsync --mkpath "${BASH_SOURCE[0]%/*/*}"/workflows/pylint_django.yml "$PWD"/.github/workflows/pylint_django.yml ) || exit
