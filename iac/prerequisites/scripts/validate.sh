#!/bin/bash

set -euo pipefail

if [ "${SYSTEM_DEBUG:=false}" == "true" ]; then
    set -x
fi

# Define the variables if they aren't set
: "${FILE_LOCATION:?must be set}"
: "${BICEP_FILENAME:?must be set}"
: "${PARAMETER_FILENAME:?must be set}"
: "${RESOURCE_GROUP_NAME:?must be set}"
: "${ENV:?must be set}"
: "${SOURCE_DIR:?must be set}"
: "${REPO_NAME:?must be set}"
: "${BICEP_REPO_NAME:=}"
: "${VERBOSE:=--verbose}"
: "${BICEP_DIR:=${SOURCE_DIR}/demo-fullstack}"

echo "Checking the working directory"
if [ -d "${SOURCE_DIR}/${REPO_NAME}" ]; then
  WORKING_DIR="${SOURCE_DIR}/${REPO_NAME}"
fi

echo "Changing the current working dir to the location '${WORKING_DIR}'"
cd "${WORKING_DIR}"

if [ -z "${TEST_DIR}" ]; then
    echo "Validating the resource: ${BICEP_FILENAME}.bicep"
    az deployment group validate ${VERBOSE} \
        --resource-group "${RESOURCE_GROUP_NAME}" \
        --template-file "${BICEP_FILENAME}" \
        --parameters "${PARAMETER_FILENAME}.json"
else
    echo "Validating the integration test resource: ${PARAMETER_FILENAME}.json"
    az deployment group validate ${VERBOSE} \
        --resource-group "${RESOURCE_GROUP_NAME}" \
        --template-file "${BICEP_FILENAME}" \
        --parameters "${PARAMETER_FILENAME}.json"
fi
