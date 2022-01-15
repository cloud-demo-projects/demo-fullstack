
targetScope = 'subscription'

resource rResourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'rg-playground'
  location: deployment().location
}

module chrisManagementDeploy 'createStorageAccount.bicep' = {
  name: deployment().name
  scope: rResourceGroup
  params: {}
}
