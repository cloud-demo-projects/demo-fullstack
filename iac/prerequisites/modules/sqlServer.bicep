@description('The name of the SQL Server.')
@minLength(3)
@maxLength(24)
param sqlServerName string

@description('The location of the SQL Server.')
param location string

resource rSqlServers 'Microsoft.Sql/servers@2021-11-01-preview' = {
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

resource rFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-11-01-preview' = {
  name: 'clientIPRule'
  parent: rSqlServers
  properties: {
    endIpAddress: '5.132.122.61'
    startIpAddress: '5.132.122.61'
  }
}

resource azureFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-11-01-preview' = {
  name: 'azureIPRule'
  parent: rSqlServers
  properties: {
    endIpAddress: '0.0.0.0'
    startIpAddress: '0.0.0.0'
  }
}
