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

# For debug.
go get -u github.com/go-delve/delve/cmd/dlv
