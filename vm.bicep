@description('Name of the Virtual Machine')
var vmName = 'my-vm'

@description('Location for the Virtual Machine')
var location = resourceGroup().location

@description('Admin username for the VM')
param adminUsername string = 'adminuser'

@secure()
@description('Admin password for the VM')
param adminPassword string

@description('Size of the VM')
var vmSize = 'Standard_DS1_v2'

@description('NIC associated with the VM')
var nicName = 'my-nic'

resource nic 'Microsoft.Network/networkInterfaces@2022-01-01' existing = {
  name: nicName
}

resource vm 'Microsoft.Compute/virtualMachines@2022-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
      linuxConfiguration: {
        disablePasswordAuthentication: false
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

// az deployment group create --resource-group myrg --template-file .\vm.bicep --parameters adminPassword=adminuser@1234
