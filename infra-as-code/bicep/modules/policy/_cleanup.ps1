
# 
# list all definitions by MgGrp ==> Get-AzPolicySetDefinition -ManagementGroupName $ManagementGrpName

$InitiativeNames = 'Deny-PublicPaaSEndpoints','Deploy-ASCDF-Config','Deploy-Diagnostics-LogAnalytics','Deploy-Private-DNS-Zones','Deploy-Sql-Security','Enforce-Encryption-CMK','Enforce-EncryptTransit'
$ManagementGrpName = 'volk'

# param(
#     [Parameter(Mandatory = $true)][string]$InitiativeNames,
#     [Parameter(Mandatory = $true)][string]$ManagementGrpName
# )
 
foreach ($InitiativeName in $InitiativeNames) {

$initiative = Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName -ErrorAction Ignore #-Custom
if ($null -ne $initiative) {

            Write-Output "Assignment for initiative $InitiativeName will be removed as RemoveAssignment parameter was set to true."
            Write-Output "Assignment $($assignment.Name) has been removed."           
 
            $Policies = (Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName).Properties.policyDefinitions.policyDefinitionId
            Remove-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName -Force | Out-Null
            Write-Output "Initiative $InitiativeName has been removed."
 
            foreach ($policy in $Policies) {
                Write-Output "Removing policy $policy assgined to $InitiativeName"
                Remove-AzPolicyDefinition -Id $policy -Force -ErrorAction Ignore #| Out-Null
                Write-Output "Policy $policy has been removed."
            }  
        }
else {
    Write-Output "Initiative $InitiativeName not found."
}

}
