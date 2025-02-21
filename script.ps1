### Install Stuff
Write-Host "Installing Chocolatey..." -ForegroundColor Green
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv
Clear-Host
Write-Host "Installing MPV, YT-DLP & Stremio..." -ForegroundColor Green
choco install mpv -y ; choco install yt-dlp -y ; choco install stremio -y ; choco install ffmpeg -y
Clear-Host
Write-Host "Installing Syncplay..." -ForegroundColor Green
choco install vcredist140 -y ; choco install syncplay --pre -y
Clear-Host


### MPV Setup
# reload path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

Write-Host "Setting up MPV..." -ForegroundColor Green
mpv.exe
Start-Sleep -Seconds 5
Stop-Process -Name mpv
$path = "$env:APPDATA\mpv\input.conf"
$lines = "WHEEL_UP seek 10`nWHEEL_DOWN seek -10"

# Check if the file exists
if (Test-Path $path) {
    # Append lines if they are not already present
    if (-not (Select-String -Path $path -Pattern "WHEEL_UP seek 10" -SimpleMatch) -or 
        -not (Select-String -Path $path -Pattern "WHEEL_DOWN seek -10" -SimpleMatch)) {
        Add-Content -Path $path -Value "`n$lines"
    }
} else {
    # Create file and add lines
    Set-Content -Path $path -Value $lines
}

# YTMP3
$path = "C:\Windows\ytmp3.bat"
if (Test-Path $path) {
} else {
    wget 'https://raw.githubusercontent.com/GerasSB/BasicMediaSetup/refs/heads/main/ytmp3.bat' -O $path
}

# YTDL
$path = "C:\Windows\ytdl.bat"
if (Test-Path $path) {
} else {
    wget 'https://raw.githubusercontent.com/GerasSB/BasicMediaSetup/refs/heads/main/ytdl.bat' -O $path
}

### Stremio Setup
# Get MPV's path
$GetMPVsPath = Get-Command mpv.exe | Select-Object -ExpandProperty Path
Set-Clipboard -Value $GetMPVsPath
Clear-Host
Write-Host "All Done!" -ForegroundColor Green
Write-Host "Your clipboard has been modified." -ForegroundColor Green
Write-Host "Search for 'mpv' in the notepad file and paste your clipboard" -ForegroundColor Green 
Write-Host "inside the brackets next to Win32." -ForegroundColor Green
Write-Host "`n"
Write-Host "Lastly, install the Torrentio addon." -ForegroundColor Green
Start-Process https://torrentio.strem.fun/configure
notepad "$env:localappdata\Programs\LNV\Stremio-4\server.js"