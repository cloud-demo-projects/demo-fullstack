
targetScope = 'subscription'

resource rResourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'test-aks9'
  location: 'westeurope'
}

module chrisManagementDeploy 'createStorageAccount.bicep' = {
  name: deployment().name
  scope: rResourceGroup
  params: {}
}
