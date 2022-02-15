
# 
# list all definitions by MgGrp ==> Get-AzPolicySetDefinition -ManagementGroupName $ManagementGrpName

$InitiativeNames = 'Deny-PublicPaaSEndpoints','Deploy-ASCDF-Config','Deploy-Diagnostics-LogAnalytics','Deploy-Private-DNS-Zones','Deploy-Sql-Security','Enforce-Encryption-CMK','Enforce-EncryptTransit'
$ManagementGrpName = 'volk'

# param(
#     [Parameter(Mandatory = $true)][string]$InitiativeNames,
#     [Parameter(Mandatory = $true)][string]$ManagementGrpName
# )
 
foreach ($InitiativeNames in $InitiativeName) {

$initiative = Get-AzPolicySetDefinition -Name $InitiativeNames -ManagementGroupName $ManagementGrpName -ErrorAction Ignore #-Custom
if ($null -ne $initiative) {

            Write-Output "Assignment for initiative $InitiativeNames will be removed as RemoveAssignment parameter was set to true."
            Remove-AzPolicyAssignment -Id $assignment.PolicyAssignmentId | Out-Null
            Write-Output "Assignment $($assignment.Name) has been removed."           
 
            $Policies = (Get-AzPolicySetDefinition -Name $InitiativeNames -ManagementGroupName $ManagementGrpName).Properties.policyDefinitions.policyDefinitionId
            Remove-AzPolicySetDefinition -Name $InitiativeNames -ManagementGroupName $ManagementGrpName -Force | Out-Null
            Write-Output "Initiative $InitiativeNames has been removed."
 
            foreach ($policy in $Policies) {
                Write-Output "Removing policy $policy assgined to $InitiativeNames"
                Remove-AzPolicyDefinition -Id $policy -Force -ErrorAction Ignore #| Out-Null
                Write-Output "Policy $policy has been removed."
            }  
        }
else {
    Write-Output "Initiative $InitiativeNames not found."
}

}
