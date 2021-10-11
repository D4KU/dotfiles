# Immediately set beam cursor
echo -ne '\e[5 q'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
p10kip="${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
[[ -r "$p10kip" ]] && source "$p10kip"

# Make autosuggestions work
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
export ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd completion)
export FORGIT_COPY_CMD='clip.exe'

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
# setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

. ~/.zinit/bin/zinit.zsh
. ~/.p10k.zsh

mvcmd() {
    local orig=$(declare -f $1)
    local new="$2${orig#$1}"
    eval "$new"
}

omzs() {
    echo OMZ::plugins/$1/$1.plugin.zsh
}

zinit light romkatv/powerlevel10k
zinit snippet $(omzs vi-mode)
zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma/fast-syntax-highlighting \
    atload"!_zsh_autosuggest_start; bindkey '^ ' forward-word" \
    zsh-users/zsh-autosuggestions \
    atload"mvcmd wd _wd; mvcmd fuzzywd wd" \
    mfaerevaag/wd \
    atinit". ~/.posixrc; . ~/.fzf.zsh" \
    kazhala/dotbare \
    wfxr/forgit \
    d4ku/f \
    $(omzs command-not-found) \
    $(omzs magic-enter) \

zle-line-init () {
    # Set beam cursor e.g. after exiting from vim
    echo -ne '\e[5 q'
}

# Change cursor for vi mode
zle-keymap-select() {
   if [ $KEYMAP = vicmd ]; then
        # Set block cursor
        echo -ne '\e[1 q'
    else
        # Set beam cursor
        echo -ne '\e[5 q'
    fi
}

# fuzzy select warp point when no parameter is passed
fuzzywd() {
  if [ $# -gt 0 ]; then
    _wd $*
  else
    local dir=$(_wd list | grep -P '(?<=->\s\s).*' -o | fzf +m)
    cd "$dir"
  fi
}
