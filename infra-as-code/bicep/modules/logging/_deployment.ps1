New-AzRoleAssignment -SignInName "lv@lvolk.com" -Scope "/" -RoleDefinitionName "Owner"

Add-AzAccount
#Select the correct subscription
Get-AzSubscription -SubscriptionName "AzIntConsumption" | Select-AzSubscription

# For Azure global regions
# Create Resource Group - optional when using an existing resource group
New-AzResourceGroup `
  -Name alz-logging `
  -Location eastus2

New-AzResourceGroupDeployment `
  -TemplateFile .\logging.bicep `
  -TemplateParameterFile .\logging.parameters.example.json `
  -ResourceGroup alz-logging