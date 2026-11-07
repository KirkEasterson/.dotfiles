#!/usr/bin/env sh

CTAGS_DIR=${XDG_DATA_HOME}/ctags

### GO
GO_CTAGS_DIR="${CTAGS_DIR}/go"
mkdir -p "$GO_CTAGS_DIR"
touch "${GO_CTAGS_DIR}/tags"
ctags -R --languages=go -f "${CTAGS_DIR}/go/tags" "$(go env GOROOT)/src" "$(go env GOPATH)/pkg/mod"
