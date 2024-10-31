@description('Name of the Resource Group')
var rgName = 'myrg'

@description('Location of the Resource Group')
var location = 'Brazil South'

@description('Name of the Virtual Network')
var vnetName = 'my-net'

@description('Name of the Subnet')
var subnetName = 'my-subnet'

@description('Address prefix for the VNet')
var vnetAddressPrefix = '10.0.0.0/16'

@description('Address prefix for the Subnet')
var subnetAddressPrefix = '10.0.1.0/24'


resource myVnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
  
}
// az deployment group create --resource-group myrg --template-file .\vnet.bicep

