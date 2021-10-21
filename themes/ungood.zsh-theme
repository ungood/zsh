ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}-%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$fg[white]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%}-"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}+"
ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[yellow]%}±"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%}?"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}A"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[magenta]%}M"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}R"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}D"

DEFAULT_LINE_COLOR="%{$fg[white]%}"

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "%{$fg[red]%}($venv) "
}

function get_line() {
    local top_line=`print -P "%3~%m%?"`
    local top_line_size=${#top_line}
    local width
    local line_color=${HOST_LINE_COLOR-${DEFAULT_LINE_COLOR}}
    (( width = ${COLUMNS} - 4 - ${top_line_size} ))
    echo "${line_color}${(l.$width..-.)}"
}

function build_prompt() {
	caret="%{%(!.$fg[red].$fg[blue])%}»"
	host="%{$fg[blue]%}%m"
	p_pwd="%{$fg[blue]%}%3~"
	retcode="%{$fg[red]%}%?"
	reset="%{${reset_color}%}"

	PS1='${p_pwd} $(get_line) ${host} ${retcode} ${reset}
$(virtualenv_info)${vimode}${caret}${reset} '

	if which git &> /dev/null; then
    	RPS1='$(git_prompt_status) $(git_prompt_short_sha)$(git_prompt_info)${reset}'
	else
    	RPS1=''
	fi

	# Make the continuation prompt match the normal prompt.
	# The reason the continuation prompt is displayed will be on the right.
	PS2='\$(virtualenv_info)${vimode}${caret}$fg[white] '
	RPS2='$fg[red]%_${reset}'
}

build_prompt