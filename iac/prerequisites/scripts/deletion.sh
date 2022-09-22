#!/bin/bash
set -euo pipefail

: "${RESOURCE_GROUP_NAME:?must be set}"
: "${DEPLOYMENT_NAME:?must be set}"
: "${VERBOSE:=--verbose}"

if [ "${SYSTEM_DEBUG:=false}" == "true" ]; then
    set -x
fi

echo "Listing resources in the deployments group '${DEPLOYMENT_NAME}'"
RESOURCELIST=$(az deployment group  show --resource-group "${RESOURCE_GROUP_NAME}" --name "${DEPLOYMENT_NAME}"  --query "properties.outputResources[].id" -o tsv)
echo "Listing all Resource Ids to be deleted\n"
echo "${RESOURCELIST}"

for RESOURCE in ${RESOURCELIST}
do
    # Check if the resource in the deployment is already deleted
    if ! OUTPUT=$(az resource show \
                --ids ${RESOURCE} \
                --resource-group "${RESOURCE_GROUP_NAME}" 2>&1); then
        echo -n "Unable to list resource ${RESOURCE}.\n"
        echo -n "Continue processing other resources in deployment group.\n"
    else
        az resource delete \
            --ids ${RESOURCE} \
            --resource-group "${RESOURCE_GROUP_NAME}" --only-show-errors
    fi
done

echo "Deleting the deployment group"
az deployment group delete ${VERBOSE} \
    --name ${DEPLOYMENT_NAME} \
    --resource-group "${RESOURCE_GROUP_NAME}"
