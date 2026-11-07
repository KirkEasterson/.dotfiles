#!/usr/bin/env sh

CTAGS_DIR=${XDG_DATA_HOME}/ctags

gen_c_ctags() {
	echo "generating ctags for C..."
	C_CTAGS_DIR="${CTAGS_DIR}/c"
	mkdir -p "$C_CTAGS_DIR"
	touch "${C_CTAGS_DIR}/tags"
	ctags -R --languages=c \
		-f "${C_CTAGS_DIR}/tags" \
		--c-kinds=+p \
		--fields=+iaS \
		/usr/include
}

gen_go_ctags() {
	echo "generating ctags for Golang..."
	GO_CTAGS_DIR="${CTAGS_DIR}/go"
	mkdir -p "$GO_CTAGS_DIR"
	touch "${GO_CTAGS_DIR}/tags"
	ctags -R --languages=go \
		-f "${GO_CTAGS_DIR}/tags" \
		"$(go env GOROOT)/src" \
		"$(go env GOPATH)/pkg/mod"
}

case "${1}" in
"all")
	gen_c_ctags
	gen_go_ctags
	;;
"c")
	gen_c_ctags
	;;
"go")
	gen_go_ctags
	;;
*)
	exit 0
	;;
esac
