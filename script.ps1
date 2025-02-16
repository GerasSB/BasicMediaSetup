# Run `Set-ExecutionPolicy Bypass -Scope Process` first
# Then run `iex ((New-Object System.Net.WebClient).DownloadString('https://LINK.PENDING'))`

### Install Stuff
Write-Host "Installing Chocolatey..." -ForegroundColor Green
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
refreshenv
clear
Write-Host "Installing MPV, YT-DLP & Stremio..." -ForegroundColor Green
cinst mpv -y ; cinst yt-dlp -y ; cinst stremio -y
clear
Write-Host "Installing Syncplay..."
cinst syncplay --pre -y
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