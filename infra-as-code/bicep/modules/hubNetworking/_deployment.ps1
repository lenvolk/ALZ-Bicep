New-AzRoleAssignment -SignInName "lv@lalz.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN-SUB" | Select-AzSubscription

# For Azure global regions
New-AzResourceGroup -Name 'ALZ-Hub_Networking_POC' `
  -Location 'eastus2'

New-AzResourceGroupDeployment `
  -TemplateFile .\hubNetworking.bicep `
  -TemplateParameterFile .\hubNetworking.parameters.example.json `
  -ResourceGroupName 'ALZ-Hub_Networking_POC'