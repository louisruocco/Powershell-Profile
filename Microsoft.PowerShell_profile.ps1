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
    $uri = Read-Host -Prompt "Please paste the repo URI here"
    $path = read-host -Prompt "Please set the path for the cloned repo to live here"

    if(!($uri -and $path)){
        Write-Host "Please specify both the uri and the path for the repo"
        return 
    }
    
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

    robocopy "C:\psprofile" "$home\Documents\Powershell" /xj /tee /np /r:0 /w:0

    set-location $home

    Remove-Item -Path "C:\psprofile" -force

    write-host "Profile Updated!"
}

function start-reading-session {
    Write-Output "Minimising windows"
    $shell = New-Object -ComObject "Shell.Application"
    $shell.minimizeall()
    Write-Output "Creating ambience..."
    start-process "https://www.youtube.com/watch?v=jfKfPfyJRdk&ab_channel=LofiGirl"
    start-process "https://www.youtube.com/watch?v=42M3esYyHdw"
}