New-AzRoleAssignment -SignInName "denver@lvolk.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

# For Azure global regions
New-AzTenantDeployment `
  -TemplateFile .\managementGroups.bicep `
  -TemplateParameterFile .\managementGroups.parameters.example.json `
  -Location eastus2