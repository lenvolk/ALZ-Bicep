
# list all definitions by MgGrp ==> Get-AzPolicySetDefinition -ManagementGroupName $ManagementGrpName

$InitiativeNames = 'Deploy-Diagnostics-LogAnalytics','Deploy-ASCDF-Config','Deny-PublicPaaSEndpoints','Deploy-Private-DNS-Zones','Deploy-Sql-Security','Enforce-Encryption-CMK','Enforce-EncryptTransit'
$ManagementGrpName = 'volk'

foreach ($InitiativeName in $InitiativeNames) {

$initiative = Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName -ErrorAction Ignore
if ($null -ne $initiative) {

            Write-Output "Assignment for initiative $InitiativeName will be removed as RemoveAssignment parameter was set to true."
 
            $Policies = (Get-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName).Properties | where -property policytype -eq custom
            $Policies = $Policies.policyDefinitions.policyDefinitionId
            Remove-AzPolicySetDefinition -Name $InitiativeName -ManagementGroupName $ManagementGrpName -Force | Out-Null
            Write-Output "Initiative $InitiativeName has been removed."
 
            foreach ($policy in $Policies) {
                Write-Output "Removing policy $policy assgined to $InitiativeName"
                Remove-AzPolicyDefinition -Id $policy -Force -ErrorAction Ignore
                Write-Output "Policy $policy has been removed."
            }  
        }
else {
    Write-Output "Initiative $InitiativeName not found."
}

}
