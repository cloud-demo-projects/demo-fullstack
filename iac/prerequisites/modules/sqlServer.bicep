@description('The name of the SQL Server.')
@minLength(3)
@maxLength(24)
param sqlServerName string

@description('The location of the SQL Server.')
param location string


resource symbolicname 'Microsoft.Sql/servers@2021-11-01-preview' = {
  name: sqlServerName
  location: location
  identity: {
    type: 'None'
    userAssignedIdentities: {}
  }
  properties: {
    administratorLogin: 'adminuser'
    administratorLoginPassword: 'Passw0rd'
    // administrators: {
    //   administratorType: 'ActiveDirectory'
    //   azureADOnlyAuthentication: false
    //   login: 'string'
    //   principalType: 'string'
    //   sid: 'string'
    //   tenantId: 'string'
    // }
    //federatedClientId: 'string'
    //keyId: 'string'
    //minimalTlsVersion: '1.2'
    //primaryUserAssignedIdentityId: 'string'
    publicNetworkAccess: 'Enabled'
    restrictOutboundNetworkAccess: 'Disabled'
    version: '12.0'
  }
}
