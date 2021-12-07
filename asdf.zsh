if [ -x "$(command -v asdf)" ]; then
    if asdf current direnv &> /dev/null; then
        eval "$(asdf exec direnv hook zsh)"    
        direnv() { asdf exec direnv "$@"; }
    else
        echo "direnv not installed:"
        asdf current direnv
    fi
else
    echo "asdf is not installed."
fi
