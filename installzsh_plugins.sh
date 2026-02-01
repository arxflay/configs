ZSH_PLUGIN_DIR=$XDG_CONFIG_HOME/zsh_plugins
mkdir $ZSH_PLUGIN_DIR
git -C $ZSH_PLUGIN_DIR clone https://github.com/agnoster/agnoster-zsh-theme.git
git -C $ZSH_PLUGIN_DIR clone https://github.com/marlonrichert/zsh-autocomplete.git
git -C $ZSH_PLUGIN_DIR clone https://github.com/zsh-users/zsh-autosuggestions.git
git -C $ZSH_PLUGIN_DIR clone https://github.com/zsh-users/zsh-syntax-highlighting.git
