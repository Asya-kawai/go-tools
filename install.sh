#!/usr/bin/env bash

# ###
# Create package.
go mod init go-tools

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

# For gRPC generator.
# If you have not installed protoc yet, see below to install protoc.
# https://grpc.io/docs/protoc-installation/
go get -u github.com/golang/protobuf/protoc-gen-go

# For debug.
# Reference: https://github.com/go-delve/delve/blob/master/Documentation/installation/linux/install.md
# Note: Can't execute 'go get ...' in module directory.
CURRENT_DIR=$(pwd)
git clone https://github.com/go-delve/delve.git $GOPATH/src/github.com/go-delve/delve
cd $GOPATH/src/github.com/go-delve/delve
make install
cd ${CURRENT_DIR}
