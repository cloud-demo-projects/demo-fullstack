@description('The name of the SQL Server.')
@minLength(3)
@maxLength(24)
param sqlServerName string

@description('The name of the SQL Server Database.')
@minLength(3)
@maxLength(24)
param sqlServerDBName string

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

resource symbolicname 'Microsoft.Sql/servers/databases@2021-11-01-preview' = {
  name: sqlServerDBName
  location: location
  sku: {
    capacity: 5
    //family: 'string'
    name: 'Basic'
    //size: 'string'
    tier: 'Basic'
  }
  parent: rSqlServers
  identity: {
    type: 'None'
    userAssignedIdentities: {}
  }
  properties: {
    //autoPauseDelay: int
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    //createMode: 'string'
    //elasticPoolId: 'string'
    //federatedClientId: 'string'
    //highAvailabilityReplicaCount: int
    isLedgerOn: false
    //licenseType: 'string'
    //longTermRetentionBackupResourceId: 'string'
    maintenanceConfigurationId: '/subscriptions/bf0f6779-86d2-467e-8226-10f92a8ad378/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    maxSizeBytes: 2147483648
    //minCapacity: json('decimal-as-string')
    readScale: 'Disabled'
    //recoverableDatabaseId: 'string'
    //recoveryServicesRecoveryPointId: 'string'
    requestedBackupStorageRedundancy: 'Local'
    //restorableDroppedDatabaseId: 'string'
    //restorePointInTime: 'string'
    //sampleName: 'string'
    //secondaryType: 'string'
    //sourceDatabaseDeletionDate: 'string'
    //sourceDatabaseId: 'string'
    //sourceResourceId: 'string'
    zoneRedundant: false
  }
}

