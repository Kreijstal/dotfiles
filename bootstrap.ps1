#requires -v 3
#set-executionpolicy unrestricted -s cu
#invoke-expression (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/Kreijstal/dotfiles/master/bootstrap.ps1')
if (Get-Command scoop -errorAction SilentlyContinue)
{
	write-host "scoop already installed"
} else {
	set-executionpolicy unrestricted -s cu #must be manual for now
	invoke-expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# utility
scoop install aria2 git-with-openssh
scoop bucket add extras https://github.com/lukesampson/scoop-extras.git
scoop bucket add nirsoft
scoop bucket add dorado https://github.com/chawyehsu/dorado
scoop install everything fzf mupdf msys2 nvm deno notepadplusplus neovim vlc gtools  heidisql   ImHex  
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')
nvm install latest
#mingw
#pacman -Syuu $MINGW_PACKAGE_PREFIX-blender $MINGW_PACKAGE_PREFIX-inkscape $MINGW_PACKAGE_PREFIX-gimp
#flatc protobuf openjdk
# rancher
#scoop install rancher-compose

# dev tools
#scoop install vagrant winmerge hugo glide vscode ngrok filezilla insomnia postman terraform
#go get -u github.com/remind101/assume-role
#go get -u github.com/golang/dep/cmd/dep

# node
nvm install latest
#npm install -g serverless

# entertainment
scoop install vlc
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force


# vim
scoop install neovim
#'
#set ff=unix
#set cindent
#set tabstop=4
#set shiftwidth=4
#set expandtab
#set backupdir=$TEMP
#' | out-file ~/.vimrc -enc oem -append

# console theme - optinal
scoop install concfg pshazz
concfg import firefly #mountain
