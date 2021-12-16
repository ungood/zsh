
if asdf current direnv &> /dev/null; then
    eval "$(asdf exec direnv hook zsh)"
    alias direnv='asdf exec direnv'
else
    echo "direnv not installed:"
    asdf current direnv
fi
