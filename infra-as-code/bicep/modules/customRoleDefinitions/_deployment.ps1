New-AzRoleAssignment -SignInName "lv@lalz.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "MSDN-SUB" | Select-AzSubscription

# For Azure global regions
New-AzManagementGroupDeployment `
  -TemplateFile .\customRoleDefinitions.bicep `
  -TemplateParameterFile .\customRoleDefinitions.parameters.example.json `
  -Location eastus2 `
  -ManagementGroupId alz