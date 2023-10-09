#!/usr/bin/env bash
{ set +x; } 2>/dev/null

# usage: init.sh path
{ set -x; cd "$1" || exit; { set +x; } 2>/dev/null; }
! [ -e setup.py ] && echo "SKIP: $PWD/setup.py NOT EXISTS" && exit

( set -x; bash "${BASH_SOURCE[0]%/*}"/pylint.sh ) || exit
( set -x; bash "${BASH_SOURCE[0]%/*}"/pylint_django.sh ) || exit
( set -x; bash "${BASH_SOURCE[0]%/*}"/pytest.sh ) || exit
