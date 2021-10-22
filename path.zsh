function append_path_if() {
    if [[ -d "$1" ]]; then
        path+=("$1")
        export path
    fi
}

append_path_if "~/bin"
append_path_if "~/.poetry/bin"
append_path_if "~/.toolbox/bin"
append_path_if "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
