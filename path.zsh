function append_path_if() {
    if [[ -e "$1" && ! ":$PATH:" == *":$1:"* ]]; then
        export PATH="$PATH:$1"
    fi
}

function print-path() {
    echo $PATH | tr ":" "\n"
}

append_path_if "$HOME/bin"
append_path_if "$HOME/.local/bin"
append_path_if "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"