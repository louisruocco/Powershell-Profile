
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
function updateprofile {
    $url = "https://github.com/louisruocco/Update-Powershell-Profile-Script"
    $path = "$home\documents\psprofileupdate"
    New-item -Path $path -type Directory
    set-location $path
    git init
    git remote add origin $url
    git pull origin master
    start-process "$home\documents\psprofileupdate\update-powershell-profile-script\script.ps1"
    set-location C:\
    remove-item $path -force
    exit
}