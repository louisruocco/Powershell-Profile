
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
    $path = new-item -Path "$home\documents\psprofileupdate" -type Directory
    set-location $path
    git init
    git remote add origin $url
    git clone $url
    start-process "$home\documents\psprofileupdate\update-powershell-profile-script\script.ps1"
    remove-item $path -force
}

function updateprofile {
    $url = "https://github.com/louisruocco/Powershell-Profile"

    New-Item -Path "C:\psprofile" -Type Directory
    Set-Location -Path "C:\psprofile"

    git init
    git remote add origin $url
    git pull origin master

    robocopy "C:\psprofile" "$home\Documents\WindowsPowerShell" /xj /tee /np /r:0 /w:0

    set-location $home

    Remove-Item -Path "C:\psprofile" -force

    write-host "Profile Updated!"
    start-sleep 2

    start-process powershell.exe
}