#!/bin/bash

cat <<EOF

**************************
** Munki auto-installer **
**************************

EOF
runDir="$(dirname "$0")"

cd "$runDir"
curl \
    -sfO \
    --connect-timeout 30 \
    https://munkibuilds.org/3.3.1.3537/munkitools-3.3.1.3537.pkg
    #https://munkibuilds.org/3.2.1.3499/munkitools-3.2.1.3499.pkg
    #https://munkibuilds.org/munkitools3-latest.pkg
package=(munkitools-*.pkg)

# install munki package
sudo installer -pkg "$package" -target /

# update install/update munki config
"$runDir/munki_config_update.sh"
