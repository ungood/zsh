
function mate-dmg() {
    local dmg=$1
    local mount_point=$2
    hdiutil attach "$dmg"
    mate "$mount_point"
}

alias sn='mate-dmg "$HOME/Documents/Notes/Secure Notes.dmg" "/Volumes/Secure Notes"'
