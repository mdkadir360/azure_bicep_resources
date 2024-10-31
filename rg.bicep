targetScope = 'subscription'
@description('Name of the Resource Group')
var rgName = 'myrg'

@description('Location of the Resource Group')
var location = 'Brazil South'

resource myResourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}



