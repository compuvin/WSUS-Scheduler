###########################
#Enter information here about your server
$WSUSServerName = "LON-WSUS"
$WSUSPortNumber = "8530" #Common choices are 8530, 80, 8531, 443
$CSVLocation = "C:\LargeFolder\WSUS-Scheduler"
$WSUSGroups = "All Computers" #"All Computers" is the default for all
###########################

#Get Updates waiting for approval from the CSV
$WSUSApproved = Import-Csv "$CSVLocation\WSUSApprovalSelections.csv"

if ($WSUSApproved -ne "") {

    #Get information about the WSUS server
    $WSUSInfo = Get-WsusServer -PortNumber $WSUSPortNumber -Name $WSUSServerName

    #Approve the updates from the CSV
    $WSUSApproved | foreach-object { Get-WsusUpdate -UpdateServer $WSUSInfo -UpdateId $_.UpdateID} | Approve-WsusUpdate -Action Install -TargetGroupName $WSUSGroups -Verbose

    #Clear CSV
    $WSUSApproved = ""
    $WSUSApproved | out-file "$CSVLocation\WSUSApprovalSelections.csv"

}