echo "2- ${PAT_TOKEN}"
echo "3- ${VAR1}"
echo "4- ${Sytem.CollectionUri}"

az devops configure --defaults organization=https://dev.azure.com/bahrinipun project=demo-fullstack
echo ${PAT_TOKEN} | az devops login --organization https://dev.azure.com/bahrinipun

az devops project list --org https://dev.azure.com/bahrinipun