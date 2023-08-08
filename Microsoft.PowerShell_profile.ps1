
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

function ghclonerepo {
    param(
        [Parameter(Mandatory)]
        [string] $uri,
        [Parameter(Mandatory)]
        [string] $path
    )

    set-location $path
    git init 
    git clone $uri
    start-sleep 1
    write-host "repo cloned successfully!"
    start-sleep 2
    cls   
}

function updateprofile {
    $url = "https://github.com/louisruocco/Powershell-Profile"

    write-host "Updating profile..."
    Start-Sleep 1

    New-Item -Path "C:\psprofile" -Type Directory
    Set-Location -Path "C:\psprofile"

    git init
    git remote add origin $url
    git pull origin master

    robocopy "C:\psprofile" "$home\Documents\WindowsPowerShell" /xj /tee /np /r:0 /w:0

    set-location $home

    Remove-Item -Path "C:\psprofile" -force

    write-host "Profile Updated!"
    . $Profile
}

function newfolder {
    param (
        [Parameter(Mandatory)]
        [string] $newFolderPath
    )

    New-Item -ItemType Directory -Path $newFolderPath
    invoke-item $newFolderPath
}

function studysession {
    $path = "C:\Users\Louis\AppData\Local\Study Session"
    if(!(Test-Path $path)){
        new-item -path $path -type Directory
        new-item "$path\url.txt"
        start-process "$path\url.txt"
    }

    start-process "https://www.youtube.com/watch?v=jfKfPfyJRdk&ab_channel=LofiGirl"
    start-process "https://www.youtube.com/watch?v=F5FhmX2I_So&ab_channel=RainSoundNatural"
    $url = Get-content "$path\url.txt"
    start-process "$url"
}