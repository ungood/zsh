alias today='date -u +%F'

# Executes a git command on all git directories under the current one.
function rgit() {
    gitdirs=(`find -L . -maxdepth 4 -type d -name \.git -print`)
    for d in $gitdirs; do
        repo_dir=`dirname $d`
        repo_name=`basename $repo_dir`
        echo "\n# ${repo_name}"
        git -C "$repo_dir" $@
    done
}
alias rst='rgit status -sb'

function update-all() {
    antigen selfupdate
    antigen update
}
