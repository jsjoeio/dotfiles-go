# We need to run this first otherwise add-apt-repository won't work
# See: https://itsfoss.com/add-apt-repository-command-not-found/
echo "Prepping for Golang installation..."
sudo apt-get -y install software-properties-common

# Necessary for installing Golang
# https://github.com/golang/go/wiki/Ubuntu
echo "Installing Golang + tooling"
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt update
sudo apt -y install golang-go
echo "Installed Go version: $(go version)"

# Need to ensure $GOPATH is on $PATH
export PATH="$GOPATH/bin:$PATH"

# Install the shfmt for code-server
echo -e "\nInstalling shfmt for code-server development"
GO111MODULE=on go get mvdan.cc/sh/v3/cmd/shfmt
echo -e "\nInstalled shfmt: $(shfmt version)"
