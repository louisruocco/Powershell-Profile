
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