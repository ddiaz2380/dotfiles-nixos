## Left Prompt
function fish_prompt
	# Set the annoying greeting to empty
	set fish_greeting
	set -l last_status $status
	# Show the current working directory
	set_color black
	if test (id -u) -eq 0
		set_color --background=yellow
	else
		set_color --background=#7b39ad
	end
	echo -n ' '
	echo -n (prompt_pwd)
	echo -n ' '
	set_color normal
	echo -n ' '
end

## Window title
function fish_title
	echo -n 'terminal fish '
	prompt_pwd
end

## Coloring
set fish_color_autosuggestion brblack
set fish_color_command normal
set fish_color_comment black
set fish_color_cwd blue
set fish_color_cwd_root red
set fish_color_end magenta
set fish_color_error yellow
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host normal
set fish_color_match blue
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param blue
set fish_color_quote green
set fish_color_redirection blue
set fish_color_search_match --background=black
set fish_color_selection blue
set fish_color_status red
set fish_color_user red
set fish_pager_color_completion blue
set fish_pager_color_description yellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan


## Aliases
alias ls="ls --group-directories-first"
alias lsl="ls --group-directories-first -lh"
alias font-refresh="fc-cache -fv"
alias cat='bat'
alias cpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias df='df -h'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gpgexportprivkey="gpg --export-secret-keys --armor"
alias gpgimportkey="gpg --import"
alias gpglistkeys="gpg --list-keys --keyid-format LONG"
alias grep='grep --color=auto'
alias kp='killprocess'
alias less='bat'
alias m='mocp'
alias mpv='devour mpv'
alias mv='mv -i'
alias p='pfetch'
alias pdw="pwd"
alias rg="rg --sort path --no-ignore --hidden" #search content with ripgrep
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl" #Recent Installed Packages
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"
alias wget="wget -c" # continue the download
alias zathura='devour zathura'
alias tm="tmux attach || tmux new -s killer-os"
alias tmd="tmux detach"
alias tmk="tmux kill-server"
alias fm="ranger"
alias sfm="sudo ranger"
alias h="htop"
alias ex="extract"

### Set alias
#############
alias c='clear'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias fastping='ping -c 100 -s.2'
alias n="neofetch"
alias v="sudo nvim"
alias rm="sudo rm"
alias rf="sudo rm -rf"
alias m="sudo mkdir"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......='cd ../../../../..'

alias free="free -mt"
alias userlist="cut -d: -f1 /etc/passwd"
alias update-fc='sudo fc-cache -fv'
alias hw="hwinfo --short"
alias neo="cmatrix"
alias vifm="sudo bash /home/daniel/.config/vifm/scripts/vifmrun"
#alias xls="x_x"
alias doc="antiword"
alias torc="$BROWSER --proxy-server='socks://127.0.0.1:9050' &"
alias porn="mpv 'http://www.pornhub.com/random'"
alias q="exit"

# Nixos
alias query-install="sudo nix-env -qa"
alias install="sudo nix-env -i"
alias update="nix-channel --update"
alias upgrade="nix-env --upgrade"
alias upgrade-system="sudo nixos-rebuild switch"
alias list-version="sudo nix-env -p /nix/var/nix/profiles/system --list-generations"
alias deleted-version="sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old"
alias limpiar-sistema="sudo nix-collect-garbage -d"
alias revertir-sistema="sudo nix-env –rollback"

#Git
alias gc="git clone --depth 1"
alias gi="git init"
alias gs="git status"
alias gl="git log --stat --pretty=oneline --graph --date=short"
alias gg="gitg &"
alias ga="git add --all"
alias gr="git remote"
alias gf="git fetch"
alias gpl="git pull"
alias gp="git push"
alias gpm="git push origin master"

#youtube-dl
alias yt="pipe-viewer"
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

alias speed="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias speedtest="speedtest-cli"
alias ipp="curl --max-time 10 -w '\n' http://ident.me"
alias ipl="ip a"
alias clima="curl wttr.in/Salta"
alias xx="pigz"

#python
alias ve="virtualenv ve"
alias vea="source ve/bin/activate"
alias ved="deactivate"
alias pipr="pip install -r requirements.txt"

## Keybinding
set fish_key_bindings fish_default_key_bindings
