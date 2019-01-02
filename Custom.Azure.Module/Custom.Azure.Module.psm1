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

        #VMí‚é~
        Get-AzureRmVM | Stop-AzureRmVM -Force -AsJob
        
        #VMSSëSí‚é~
        Get-AzureRmVmss | Stop-AzureRmVmss -Force -AsJob
    }
    End{
    }
}