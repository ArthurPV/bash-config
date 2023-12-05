#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias gl="git log"
alias gs="git status"
alias gsh="git show"
alias gp="git push"
alias gpu="git pull"
alias gc="git commit"
alias gf="git fetch"
alias gr="git rebase"
alias gm="git merge"
alias gb="git branch"
alias gd="git diff"
alias gt="git tag"
alias gcl="git clone"
alias gin="git init"
alias ll="ls -lh"
alias ls="ls --color=auto"

BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
PURPLE='\[\e[35m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
RESET='\[\e[0m\]'

BOLD='\[\e[1m\]'

function show_jobs() {
	if [ $(jobs | wc -l) -gt 0 ]
	then
		echo "${YELLOW}&\j${RESET}"
	else
		echo ""
	fi
}

function show_status() {
	local status=$?

	if [ $status -eq 0 ]
	then
		echo ""
	else
		echo "${RED}=${status}${RESET}"
	fi
}

function show_git_branch() {
	local branch_or_commit=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || git rev-parse HEAD 2>/dev/null)

	if [ "$git_branch" == "" ]
	then
		echo ""
	else
		echo "${RESET}#${WHITE}${branch_or_commit}${RESET}"
	fi
}

function show_git_status() {
	local git_status=$(git status --porcelain 2>/dev/null)

	if [ "$git_status" == "" ]
	then
		echo ""
	else
		echo "${WHITE}*${RESET}"
	fi
}

function update_ps1() {
	PS1="$(show_status)${BOLD}|${RESET}${BLUE}\u${PURPLE}@${BLUE}\h$(show_jobs)${BOLD}|${RESET}:${BOLD}(${RESET}${PURPLE}\W${RESET}$(show_git_branch)$(show_git_status)${BOLD})${RESET}${BLUE}\\$"${RESET}" "
}

PROMPT_COMMAND=update_ps1
