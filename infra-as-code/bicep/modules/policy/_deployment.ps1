New-AzRoleAssignment -SignInName "lv@lvolk.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

# For Azure global regions
New-AzManagementGroupDeployment `
  -TemplateFile .\definitions\custom-policy-definitions.bicep `
  -TemplateParameterFile .\definitions\custom-policy-definitions.parameters.example.json `
  -Location eastus2 `
  -ManagementGroupId 'volk'