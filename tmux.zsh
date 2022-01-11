function tm() {
    session=${1:-default}
    tmux -CC attach-session -t $session || tmux -CC new-session -s $session;
}
