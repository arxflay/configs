setopt prompt_subst
setopt auto_cd

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000

HISTFILE=$HOME/.cache/.zhistory
setopt INC_APPEND_HISTORY
export ENABLE_CORRECTION="true"
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY

#source $HOME/esp/esp-idf/export.sh
#source $HOME/python-venv/bin/activate
#set ENV_DEACT_LOC $HOME/python-venv/bin/
ZSH_PLUGIN_DIR=$XDG_CONFIG_HOME/zsh_plugins

source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh
source$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_DIR/agnoster-zsh-theme/agnoster.zsh-theme
export PROMPT="${(F)AGNOSTER_PROMPT_SEGMENTS[@]}"
