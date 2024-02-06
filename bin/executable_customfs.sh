pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
       export PATH="${PATH:+"$PATH:"}$1"
    fi
}

add_cd_path() {
    pathadd "$(pwd)"
}
pathadd ~/bin
pathadd ~/.local/share/junest/bin
pathadd ~/.local/bin
