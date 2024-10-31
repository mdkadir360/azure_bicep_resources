@description('Name of the Public IP Address')
var publicIpName = 'mypip'

@description('Location of the Public IP Address')
var location = resourceGroup().location

@description('SKU of the Public IP Address')
var sku = 'Basic' // Can also be 'Standard'

resource publicIp 'Microsoft.Network/publicIPAddresses@2022-01-01' = {
  name: publicIpName
  location: location
  sku: {
    name: sku
  }
  properties: {
    publicIPAllocationMethod: 'Static' // Options: 'Static' or 'Dynamic'
  }
}
// az deployment group create --resource-group myrg --template-file .\pip.bicep

