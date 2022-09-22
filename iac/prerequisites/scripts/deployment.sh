#!/bin/bash

set -euo pipefail

if [ "${SYSTEM_DEBUG:=false}" == "true" ]; then
    set -x
fi

# Define the variables if they aren't set
: "${BICEP_FILENAME:?must be set}"
: "${PARAMETER_FILENAME:?must be set}"
: "${RESOURCE_GROUP_NAME:?must be set}"
: "${ENV:?must be set}"
: "${BICEP_ACTION:?must be set}"
: "${DEPLOYMENT_NAME:?must be set}"
: "${SOURCE_DIR:?must be set}"
: "${REPO_NAME:?must be set}"
: "${VERBOSE:=--verbose}"
: "${BICEP_DIR:=${SOURCE_DIR}/mcpk-templates}"

echo "Checking the working directory"
if [ -d "${SOURCE_DIR}/${REPO_NAME}" ]; then
  WORKING_DIR="${SOURCE_DIR}/${REPO_NAME}"
fi

echo "Changing the current working dir to the location '${WORKING_DIR}'"
cd "${WORKING_DIR}"

echo "Deploy the resource: ${BICEP_FILENAME}.bicep"
if [ -z "${TEST_DIR}" ]; then
    echo "Deploying the resource: ${BICEP_FILENAME}.bicep"
    az deployment group "${BICEP_ACTION}" \
                        --name "${DEPLOYMENT_NAME}" \
                        --resource-group "${RESOURCE_GROUP_NAME}" \
                        --template-file "${BICEP_FILENAME}.bicep" \
                        --parameters "${PARAMETER_FILENAME}.json"
else
    echo "Deploying the test resource: ${PARAMETER_FILENAME}.json"
    az deployment group "${BICEP_ACTION}" \
                        --name "${DEPLOYMENT_NAME}" \
                        --resource-group "${RESOURCE_GROUP_NAME}" \
                        --template-file "${BICEP_FILENAME}.bicep" \
                        --parameters "${PARAMETER_FILENAME}.json"
fi
echo "Deployed: '${DEPLOYMENT_NAME}'"
