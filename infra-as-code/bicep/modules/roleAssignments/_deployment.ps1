New-AzManagementGroupDeployment `
  -TemplateFile .\roleAssignmentManagementGroup.bicep `
  -TemplateParameterFile .\roleAssignmentManagementGroup.parameters.managed-identity.example.json `
  -ManagementGroupId alz `
  -Location eastus2