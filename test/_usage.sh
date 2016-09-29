#!/bin/bash
# see http://www.gnu.org/s/bash/manual/html_node/The-Set-Builtin.html
set -o errexit  # exit on [ $? != 0 ]
set -o nounset  # exit on uninitialized vars

cd "$(dirname "$0")"

mkdir -p 'temp/_usage'
pushd 'temp/_usage' > /dev/null

mkdir 'assets'
touch 'assets/favicon.ico'

mkdir 'assets/style'
touch 'assets/style/app.css'
touch 'assets/style/vendor.css'

tree

../../../index.js assets/favicon.ico assets/style dist

tree

popd > /dev/null
rm -rf 'temp/_usage'
