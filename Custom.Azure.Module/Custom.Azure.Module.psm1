#Import-Module AzureRM

function Test-HogeHoge
{
    Write-Host "HogeHoge"
}

function Save-AzureCustomSubscriptionCost
{
    param(
        [Parameter(ValueFromPipeline=$true,Mandatory=$true)]
        [string]
        $Subsctiption
    )

    Begin{
    }
    Process{
        Select-AzureRmSubscription -Subscription $Subsctiption

        #VM��~
        Get-AzureRmVM | Stop-AzureRmVM -Force -AsJob
        
        #VMSS�S��~
        Get-AzureRmVmss | Stop-AzureRmVmss -Force -AsJob
    }
    End{
    }
}