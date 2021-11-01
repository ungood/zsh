if [ -x "$(command -v direnv)" ]; then
    eval "$(direnv hook zsh)"
else
    echo "direnv is not installed."
fi
