echo ${testarg1}
echo ${PAT_TOKEN}
echo $(PAT_TOKEN)

az devops configure --defaults organization=https://dev.azure.com/bahrinipun project=demo-fullstack
echo ${PAT_TOKEN} | az devops login --organization https://dev.azure.com/bahrinipun

az devops project list --org https://dev.azure.com/bahrinipun