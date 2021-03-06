#!/usr/bin/env bash

# ###
# Create package.
go mod init go-tools

# ###
# Initialize packages
go mod tidy

# ###
# Install commands.

# For auto-complete packages in project.
go get -u golang.org/x/tools/cmd/goimports@latest

# For LSP of go.
# Note: Do not use the -u flag, as it will update your dependencies to incompatible versions.
# Reference: https://github.com/golang/tools/blob/master/gopls/doc/user.md
go get golang.org/x/tools/gopls@latest

# For basic tools of go.
go get -u golang.org/x/lint/golint
go get -u github.com/rogpeppe/godef
go get -u github.com/kisielk/errcheck

# For generator test template.
go get -u github.com/cweill/gotests/...

# For protocol buffer generator for go.
# Note: v2 does not work!
#go install google.golang.org/protobuf/cmd/protoc-gen-go
go get -u github.com/golang/protobuf/protoc-gen-go

# For pkgtwist which is checker whether installed packages are evil or not.
go get gitlab.com/michenriksen/pkgtwist/cmd/pkgtwist

# For debug.
# Reference: https://github.com/go-delve/delve/blob/master/Documentation/installation/linux/install.md
# Note: Can't execute 'go get ...' in module directory.
CURRENT_DIR=$(pwd)
git clone https://github.com/go-delve/delve.git $GOPATH/src/github.com/go-delve/delve
cd $GOPATH/src/github.com/go-delve/delve
make install
cd ${CURRENT_DIR}
