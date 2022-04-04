echo "2- ${PAT_TOKEN}"
echo "3- ${VAR1}"
echo "4- ${Sytem.CollectionUri}"
echo "5- ${VAR2}"
echo "6- ${{ parameters.PARAM }}"
echo "7- ${TESTURL}"

az devops configure --defaults organization=https://dev.azure.com/bahrinipun project=demo-fullstack
echo ${PAT_TOKEN} | az devops login --organization https://dev.azure.com/bahrinipun

project=$(az devops project list --org https://dev.azure.com/bahrinipun)
echo $project