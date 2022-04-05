echo "2- ${PAT_TOKEN}"
echo "3- ${VAR1}"
echo "4- ${Sytem.CollectionUri}"
echo "5- ${var3}"
echo "55- ${VAR3}"
echo "6- ${{ parameters.PARAM }}"
echo "7- ${TESTURL}"

"${PAT_TOKEN:?must be set}"

az devops configure --defaults organization=https://dev.azure.com/bahrinipun project=demo-fullstack
echo ${PAT_TOKEN} | az devops login --organization https://dev.azure.com/bahrinipun

project=$(az devops project list --org https://dev.azure.com/bahrinipun)
echo $project