#New-AzRoleAssignment -SignInName "denver@lalz.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN-SUB" | Select-AzSubscription

# For Azure global regions
New-AzTenantDeployment `
  -TemplateFile .\managementGroups.bicep `
  -TemplateParameterFile .\managementGroups.parameters.example.json `
  -Location eastus2