@description('Name of the Network Interface Card')
var nicName = 'my-nic'

@description('Location for the Network Interface Card')
var location = resourceGroup().location

@description('Name of the Subnet')
var subnetId = '/subscriptions/9d8fb070-f9ed-4198-b416-cbdb60a8c463/resourceGroups/myrg/providers/Microsoft.Network/virtualNetworks/my-net/subnets/my-subnet'

@description('Name of the Public IP')
var publicIpName = 'mypip'

@description('Name of the Network Security Group')
var nsgName = 'my-nsg'

resource publicIp 'Microsoft.Network/publicIPAddresses@2022-01-01' existing = {
  name: publicIpName
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2022-01-01' existing = {
  name: nsgName
}

resource nic 'Microsoft.Network/networkInterfaces@2022-01-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          publicIPAddress: {
            id: publicIp.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}
