###########################
#Enter information here about your server
$WSUSServerName = "LON-WSUS"
$WSUSPortNumber = "8530" #Common choices are 8530, 80, 8531, 443
$CSVLocation = "C:\LargeFolder\WSUS-Scheduler"
###########################

#Get information about the WSUS server
$WSUSInfo = Get-WsusServer -PortNumber $WSUSPortNumber -Name $WSUSServerName

#Get available updates to schedule
Write-Output "`nPlease wait while a list of available updates is generated from the server..."
$WSUSApproved = Get-WsusUpdate -Classification All -Approval Approved -Status FailedOrNeeded -UpdateServer $WSUSInfo
$WSUSApproved = $WSUSApproved | Out-GridView -PassThru -Title "Select updates to schedule"

#OutCSV
Write-Output "`nThe following updates that you have selected have been scheduled for approval:"
$WSUSApproved
$WSUSApproved | select UpdateID | Export-Csv "$CSVLocation\WSUSApprovalSelections.csv"
