#!/usr/bin/env bash

if [[ -z "${BUILD_SOURCEVERSION}" ]]; then

    # Void updated this to use the BUILD_SOURCEVERSION with voidVersion
    echo "running version.sh"
    # Check if vscode directory exists
    if [[ -d "./vscode" ]]; then
        echo "getting vscode source version..."
        # Get the current commit hash from the vscode repository
        CURRENT_DIR=$(pwd)
        cd ./vscode
        BUILD_SOURCEVERSION=$(git rev-parse HEAD)
        cd ..
    else
      npm install -g checksum

      BUILD_SOURCEVERSION=$( echo "${RELEASE_VERSION/-*/}" | checksum )
    fi

    echo "BUILD_SOURCEVERSION=\"${BUILD_SOURCEVERSION}\""

    # for GH actions
    if [[ "${GITHUB_ENV}" ]]; then
        echo "BUILD_SOURCEVERSION=${BUILD_SOURCEVERSION}" >> "${GITHUB_ENV}"
    fi
fi

export BUILD_SOURCEVERSION
