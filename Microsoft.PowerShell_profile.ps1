
$shell = $Host.UI.RawUI
$shell.ForegroundColor = "green"

set-location C:\

$date = date

write-host $date

Start-Process -FilePath "powershell" -Verb RunAs
function openmail {
    start-process ms-unistore-email:
}


function p {
    param(
        [Parameter(Mandatory)]
        [string]$address
    )

    $ping = test-connection $address -count 1 -quiet
    if($ping -eq "true"){
        return write-host "$address online"
    } else {
        return write-host "$address offline"
    }
}