zenityResult=$(
  zenity --list --checklist --title="Choose Packages to Install" --width="1000" --height="400" \
         --column="Select" --column="Package Name" --column="Description" \
         " " gimp "Known as GIMP, GNU Image Manipulation Program is a free and open source photo editor." \
         " " neofetch "A command-line system information tool." \
         " " caffeine "A status bar application able to temporarily prevent the activation of both the screensaver and the sleep powersaving mode." \
         " " bleachbit "BleachBit is a free and open-source disk space cleaner, privacy manager, and computer system optimizer." \
         " " vlc-media-player "VLC media player is a free and open-source, portable, cross-platform media player and streaming media server." \
         " " vim-editor "VIM is a free and open-source command-line text editor" \
         " " inkscape "Inkscape is a free and open-source vector graphics editor." \
)

echo "These options were selected:"
echo $zenityResult

# Wildcards (*) around the result will find matches.
if [[ $zenityResult == *"gimp"* ]]; then
  sudo apt-get install gimp
fi

if [[ $zenityResult == *"neofetch"* ]]; then
  sudo apt-get install neofetch
fi

if [[ $zenityResult == *"caffeine"* ]]; then
  sudo apt-get install caffeine
fi

if [[ $zenityResult == *"bleachbit"* ]]; then
  sudo apt-get install bleachbit
fi

if [[ $zenityResult == *"vlc-media-player"* ]]; then
  sudo apt-get install vlc-media-player
fi

if [[ $zenityResult == *"vim-editor"* ]]; then
  sudo apt-get install vim-editor
fi

if [[ $zenityResult == *"inkscape"* ]]; then
  sudo apt-get install inkscape
fi
