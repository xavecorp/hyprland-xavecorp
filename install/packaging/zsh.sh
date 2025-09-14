#!/bin/bash

if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi

# Install custom zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

zsh_paths=(
    "$HOME/.oh-my-zsh"
    "/usr/local/share/oh-my-zsh"
    "/usr/share/oh-my-zsh"
)
for zsh_path in "${zsh_paths[@]}"; do [[ -d $zsh_path ]] && Zsh_Path=$zsh_path && break; done

# set variables
Zsh_rc="${ZDOTDIR:-$HOME}/.zshenv"
Zsh_Path="${Zsh_Path:-$HOME/.oh-my-zsh}"
Zsh_Plugins="$Zsh_Path/custom/plugins"
Fix_Completion=""

# generate plugins from list
while read -r r_plugin; do
    z_plugin=$(awk -F '/' '{print $NF}' <<<"${r_plugin}")
    if [ "${r_plugin:0:4}" == "http" ] && [ ! -d "${Zsh_Plugins}/${z_plugin}" ]; then
        if [ -w "${Zsh_Plugins}" ]; then
            git clone "${r_plugin}" "${Zsh_Plugins}/${z_plugin}"
        else
            sudo git clone "${r_plugin}" "${Zsh_Plugins}/${z_plugin}"
        fi
    fi
    if [ "${z_plugin}" == "zsh-completions" ] && [ "$(grep -c 'fpath+=.*plugins/zsh-completions/src' "${Zsh_rc}")" -eq 0 ]; then
        Fix_Completion='\nfpath+=${ZSH_CUSTOM:-${ZSH:-/usr/share/oh-my-zsh}/custom}/plugins/zsh-completions/src'
    else
        [ -z "${z_plugin}" ] || w_plugin+=" ${z_plugin}"
    fi
done < <(cut -d '#' -f 1 "${scrDir}/zsh.lst" | sed 's/ //g')

# update plugin array in zshrc
sed -i "/^hyde_plugins=/c\hyde_plugins=(${w_plugin} )${Fix_Completion}" "${Zsh_rc}"
