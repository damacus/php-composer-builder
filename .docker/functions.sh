#!/bin/sh
set +o pipefail

export DESCRIPTION="Docker container composer on PHP 7.2"
if [[ -z $ORG ]];then 
  ORG="damacus"
fi
if [[ -z $BUILD_SCRIPT_VER ]];then
	BUILD_SCRIPT_VER='master'
fi

if ! [[ -e .docker/external_functions.sh ]];then
  wget -O ".docker/external_functions.sh" "https://raw.githubusercontent.com/${ORG}/docker-build-scripts/${BUILD_SCRIPT_VER}/functions.sh"
fi

source ".docker/external_functions.sh"
