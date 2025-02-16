# Run `Set-ExecutionPolicy Bypass -Scope Process` first
# Then run `iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/GerasSB/BasicMediaSetup/refs/heads/main/script.ps1'))`

### Install Stuff
Write-Host "Installing Chocolatey..." -ForegroundColor Green
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv
clear
Write-Host "Installing MPV, YT-DLP & Stremio..." -ForegroundColor Green
choco install mpv -y ; choco install yt-dlp -y ; choco install stremio -y
clear
Write-Host "Installing Syncplay..."
choco install syncplay --pre -y
### MPV Setup
Write-Host "Setting up MPV..."
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