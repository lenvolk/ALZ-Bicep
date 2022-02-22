New-AzRoleAssignment -SignInName "lv@lvolk.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

# For Azure global regions
New-AzManagementGroupDeployment `
  -TemplateFile .\customRoleDefinitions.bicep `
  -TemplateParameterFile .\customRoleDefinitions.parameters.example.json `
  -Location eastus2 `
  -ManagementGroupId alz