
$shell = $Host.UI.RawUI
$shell.ForegroundColor = "green"
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
    $url = "https://github.com/louisruocco/Update-Powershell-Profile-Script"

    New-Item -Path "C:\Documents\updatepsprofile" -Type Directory
    set-location "C:\Documents\updatepsprofile"

    git init
    git remote add origin $url
    git clone $url

    Start-Process "C:\Documents\updatepsprofile\Update-Powershell-Profile-Script\script.ps1"

    Remove-Item C:\Documents\updatepsprofile

    write-host "Profile Updated!"
}