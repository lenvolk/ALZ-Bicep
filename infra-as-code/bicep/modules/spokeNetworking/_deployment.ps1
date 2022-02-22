Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

New-AzResourceGroup -Name 'Spoke_Networking_POC' `
  -Location 'EastUs'
  
New-AzResourceGroupDeployment `
  -TemplateFile .\spokeNetworking.bicep `
  -TemplateParameterFile .\spokeNetworking.parameters.example.json `
  -ResourceGroupName 'Spoke_Networking_POC'