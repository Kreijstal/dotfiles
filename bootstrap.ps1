#requires -v 3

if (Get-Command scoop -errorAction SilentlyContinue)
{
	write-host "scoop already installed"
} else {
	set-executionpolicy unrestricted -s cu
	invoke-expression (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# utility
scoop install git git-lfs 7zip curl sudo openssh openssl coreutils grep sed less which zip unzip tar gzip make
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')

scoop bucket add extras https://github.com/lukesampson/scoop-extras.git
# programming languages
scoop install python ruby go openjdk flatc protobuf nvm dotnet nuget

# rancher
scoop install rancher-compose

# dev tools
scoop install vagrant winmerge hugo glide vscode ngrok filezilla insomnia postman terraform
go get -u github.com/remind101/assume-role
go get -u github.com/golang/dep/cmd/dep

# node
nvm install latest
npm install -g serverless

# entertainment
scoop install vlc

# vim
scoop install vim
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
