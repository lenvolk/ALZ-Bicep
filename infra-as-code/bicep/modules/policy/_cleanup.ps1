
# 
# list all definitions by MgGrp ==> Get-AzPolicySetDefinition -ManagementGroupName $ManagementGrpName

$InitiativeName = 'Enforce-Encryption-CMK' #'Configure Azure PaaS services to use private DNS zones'
$ManagementGrpName = 'volk'

param(
    [Parameter(Mandatory = $true)][string]$InitiativeName,
    [Parameter(Mandatory = $true)][string]$ManagementGrpName
)
 
$initiative = Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName #-Custom -ErrorAction Ignore
if ($null -ne $initiative) {

            Write-Output "Assignment for initiative $InitiativeName will be removed as RemoveAssignment parameter was set to true."
            Remove-AzPolicyAssignment -Id $assignment.PolicyAssignmentId | Out-Null
            Write-Output "Assignment $($assignment.Name) has been removed."           
 
            $Policies = (Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName).Properties.policyDefinitions.policyDefinitionId
            Remove-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName -Force | Out-Null
            Write-Output "Initiative $InitiativeName has been removed."
 
            foreach ($policy in $Policies) {
                Write-Output "Removing policy $policy assgined to $InitiativeName"
                Remove-AzPolicyDefinition -Id $policy -Force | Out-Null
                Write-Output "Policy $policy has been removed."
            }  
        }
else {
    Write-Output "Initiative $InitiativeName not found."
}
