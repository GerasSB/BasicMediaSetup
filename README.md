# Instructions

### 1. Open a Powershell Window as Administrator
Quickest way to do it is with the keyboard shortcut `Windows + X` and picking the Powershell option from the menu (or simply pressing `A`).
### 2. Run this command
```ps1
irm "https://raw.githubusercontent.com/GerasSB/BasicMediaSetup/refs/heads/main/script.ps1" | iex
```
### 3. Configure Stremio to allow MPV
Inside the Notepad file that opens up, search for "mpv" (should be the second result) and paste your clipboard inside the brackets next to "Win32".

### 4. Install Torrentio
Configure and install the Torrentio addon via the link that opens up in your browser.

# Features
* MPV: video player
* YT-DLP: Youtube (& other sites) downloader
* Syncplay: watch videos with friends
* Stremio: live-playback torrenting for shows & movies
* New simple commands:
    * ytmp3: download a youtube video as mp3
    * ytdl: download a youtube video in the best quality available