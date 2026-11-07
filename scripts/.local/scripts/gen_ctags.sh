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

gen_cpp_ctags() {
	echo "generating ctags for C++..."
	CPP_CTAGS_DIR="${CTAGS_DIR}/cpp"
	mkdir -p "$CPP_CTAGS_DIR"
	touch "${CPP_CTAGS_DIR}/tags"
	ctags -R --languages=c++ \
		-f "${CPP_CTAGS_DIR}/tags" \
		--c++-kinds=+p \
		--fields=+iaS \
		--extras=+q \
		-I _GLIBCXX_NOEXCEPT \
		/usr/include/c++/$(ls /usr/include/c++/ | tail -n 1)
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

gen_rust_tags() {
	echo "generating ctags for Rust..."
	RUST_CTAGS_DIR="${CTAGS_DIR}/rust"
	mkdir -p "$RUST_CTAGS_DIR"
	touch "${RUST_CTAGS_DIR}/tags"
	ctags -R --languages=rust \
		-f "${RUST_CTAGS_DIR}/tags" \
		"$(rustc --print sysroot)/lib/rustlib/src/rust/library/"
}

case "${1}" in
"all")
	gen_c_ctags
	gen_cpp_ctags
	gen_go_ctags
	gen_rust_ctags
	;;
"c")
	gen_c_ctags
	;;
"cpp")
	gen_cpp_ctags
	;;
"go")
	gen_go_ctags
	;;
"rust")
	gen_rust_tags
	;;
*)
	exit 0
	;;
esac
