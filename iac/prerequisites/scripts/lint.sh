#!/bin/bash

set -euo pipefail

if [ "${SYSTEM_DEBUG:=false}" == "true" ]; then
    set -x
fi

# Define the variables if they aren't set
: "${BICEP_FILENAME:?must be set}"
: "${SOURCE_DIR:?must be set}"
: "${BICEP_REPO_NAME:=demo-fullstack}"
: "${VERBOSE:=--verbose}"

echo "Checking the working directory"
if [ -d "${SOURCE_DIR}/${BICEP_REPO_NAME}" ]; then
  WORKING_DIR="${SOURCE_DIR}/${BICEP_REPO_NAME}"
fi

echo "Changing the current working dir to the location '${WORKING_DIR}'"
cd "${WORKING_DIR}"

echo "Linting the resource: ${BICEP_FILENAME}"
az bicep build  ${VERBOSE} --file ${BICEP_FILENAME}
