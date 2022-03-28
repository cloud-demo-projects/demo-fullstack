param sacName string

resource rStorageAccountContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-04-01' = {
  name: '${sacName}/default/akstfstate'
  properties: {}
}
