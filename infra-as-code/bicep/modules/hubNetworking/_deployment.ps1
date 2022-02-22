New-AzRoleAssignment -SignInName "lv@lvolk.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

# For Azure global regions
New-AzResourceGroup -Name 'Hub_Networking_POC' `
  -Location 'eastus2'

  New-AzResourceGroupDeployment `
  -TemplateFile .\hubNetworking.bicep `
  -TemplateParameterFile .\hubNetworking.parameters.example.json `
  -ResourceGroupName 'Hub_Networking_POC'