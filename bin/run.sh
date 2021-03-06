#!/usr/bin/env bash
# Script to run the image

SCRIPTNAME="$(realpath $0)"
SCRIPTPATH="$(dirname $SCRIPTNAME)"

# `name` and `version` configured from here
source ${SCRIPTPATH}/../.info

# Create the ~/.saml2aws if it doesn't exist
touch ${HOME}/.saml2aws

docker run \
  -v ${SCRIPTPATH}/..:/home/${user}/host_mount \
  -v ${HOME}/.aws:/home/${user}/.aws \
  -v ${HOME}/.saml2aws:/home/${user}/.saml2aws \
  -u ${user} \
  -it ${name}:${version} /bin/bash \
  ${1}
