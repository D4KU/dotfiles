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

alias -s {md,txt,json,cs,csv,cpp,h,vim,py}=vim
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdtohome
setopt pushdsilent
setopt pushdminus
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

. ~/.p10k.zsh
. ~/.zinit/bin/zinit.zsh

omzs() {
    echo OMZ::plugins/$1/$1.plugin.zsh
}

zi light romkatv/powerlevel10k
zi snippet $(omzs vi-mode)
zi wait lucid light-mode for \
    atinit". ~/.posixrc; . ~/.fzf.zsh" \
    d4ku/f \
    mfaerevaag/wd \
    d4ku/forgit \
    kazhala/dotbare \
    atload"!_zsh_autosuggest_start; bindkey '^ ' forward-word" \
    zsh-users/zsh-autosuggestions \
    peterhurford/git-it-on.zsh \
    $(omzs command-not-found) \
    atload"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \

zle-line-init() {
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

accept-line() {
    if [[ -z "$BUFFER" && "$CONTEXT" == start ]]; then
	BUFFER="f 1"
    fi
    zle .accept-line
}
zle -N accept-line
