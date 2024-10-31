# Define Variables



az deployment sub create --location 'Brazil South' --template-file .\rg.bicep 
az deployment group create --resource-group myrg --template-file .\vnet.bicep


az deployment group create --resource-group myrg --template-file .\pip.bicep 
az deployment group create --resource-group myrg --template-file .\nsg.bicep
az deployment group create --resource-group myrg --template-file .\nic.bicep
az deployment group create --resource-group myrg --template-file .\vm.bicep --parameters adminPassword=adminuser@1234
