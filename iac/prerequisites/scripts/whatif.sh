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
: "${VERBOSE:=--verbose}"
: "${BICEP_DIR:=${SOURCE_DIR}/demo-fullstack}"

echo "Checking the working directory"
if [ -d "${SOURCE_DIR}/${REPO_NAME}" ]; then
  WORKING_DIR="${SOURCE_DIR}/${REPO_NAME}"
fi

echo "Changing the current working dir to the location '${WORKING_DIR}'"
cd "${WORKING_DIR}"

if [ -z "${INTEGRATION_TEST_DIR}" ]; then
    echo "what-if the resource: ${BICEP_DIR}/resources/${FILE_LOCATION}/${BICEP_FILENAME}.bicep"
    az deployment group what-if ${VERBOSE} \
    --resource-group "${RESOURCE_GROUP_NAME}" \
    --template-file "${BICEP_DIR}/resources/${FILE_LOCATION}/${BICEP_FILENAME}.bicep" \
    --parameters "${SOURCE_DIR}/${REPO_NAME}/configuration/${ENV}/${FILE_LOCATION}/${PARAMETER_FILENAME}.json"
else
    echo "what-if the integration test resource: ${SOURCE_DIR}/${REPO_NAME}/${INTEGRATION_TEST_DIR}/configuration/${ENV}/${FILE_LOCATION}/${PARAMETER_FILENAME}.json"
    az deployment group what-if ${VERBOSE} \
    --resource-group "${RESOURCE_GROUP_NAME}" \
    --template-file "${BICEP_DIR}/resources/${FILE_LOCATION}/${BICEP_FILENAME}.bicep" \
    --parameters "${SOURCE_DIR}/${REPO_NAME}/${INTEGRATION_TEST_DIR}/configuration/${ENV}/${FILE_LOCATION}/${PARAMETER_FILENAME}.json"
fi


