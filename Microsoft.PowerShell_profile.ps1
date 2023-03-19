
$shell = $Host.UI.RawUI
$shell.ForegroundColor = "green"

set-location C:\

$date = date

write-host $date

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

function psprofileupdate {
    start-process "D:\Code\Update-PSprofile\script.ps1"
}

Start-Job -FilePath "D:\Code\Astronomy Picture of the Day\script.ps1"