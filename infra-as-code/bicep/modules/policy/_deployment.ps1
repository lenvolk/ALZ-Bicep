# For Azure global regions
New-AzManagementGroupDeployment `
  -TemplateFile .\definitions\custom-policy-definitions.bicep `
  -TemplateParameterFile .\definitions\custom-policy-definitions.parameters.example.json `
  -Location eastus2 `
  -ManagementGroupId 'a659fe98-5688-4592-99cd-0be85cd550bc'