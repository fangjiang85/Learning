#This Script is for remotely triggering Windows Update for Server by using the PSWindowsUpdate module

Function Invoke-WuScheduleJob {
 
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName
        )]
        [String[]]
        $ComputerName
    )

    Begin {
         
        Try {Import-Module PSWindowsUpdate -ErrorAction Stop}
      
        Catch  { Install-Module PSWindowsUpdate -Force}           

    }

    Process {

        Foreach($Computer in $ComputerName){

            Try {Import-Module PSWindowsUpdate -ErrorAction Stop}
      
            Catch  { Install-Module PSWindowsUpdate -Force}   

            Invoke-WUJob -ComputerName $Computer -Script {Install-WindowsUpdate -Install -AcceptAll -AutoReboot -PSWUSettings -}
        }

        }

    }
