#!/bin/sh
set +o pipefail

export PROJECT="php-composer-builder"
export DESCRIPTION="Docker container composer on PHP 7.1"
export MAINTAINER="damacus"

if ! [[ -e .docker/external_functions.sh ]];then
  wget -O ".docker/external_functions.sh" "https://raw.githubusercontent.com/damacus/docker-build-scripts/master/functions.sh"
fi
