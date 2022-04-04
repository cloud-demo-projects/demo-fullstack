echo ${testarg1}

az devops configure --defaults organization=https://dev.azure.com/bahrinipun project=demo-fullstack
echo $(PAT_TOKEN) | az devops login --organization https://dev.azure.com/bahrinipun

az devops project list --detect