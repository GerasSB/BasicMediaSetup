@echo off

echo ---NOTE: THE FILE WILL BE SAVED TO YOUR---
echo --------SHELL'S CURRENT DIRECTORY---------
echo.
echo Enter your Youtube link:
set /P ytlink= :

yt-dlp -x --audio-format mp3 "%ytlink%"