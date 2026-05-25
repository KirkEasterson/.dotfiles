#!/usr/bin/env bash

nvim_appname="nvim-notes"

# edit toay's note
edit_today() {
	now=$(date +%H:%M:%S)
	today=$(date +%Y-%m-%d)
	today_note_file="${src_dir}/note-${today}.md"

	# check if file exists
	if [ ! -f "${today_note_file}" ]; then
		printf "# Notes for %s" "${today}" >"${today_note_file}"
	fi

	NVIM_APPNAME="$nvim_appname" nvim \
		-c "norm Go" \
		-c "norm Go## ${now}" \
		-c "norm G2o" \
		-c "startinsert" "${today_note_file}"
}

# build a specified note
build() {
	src="$1"
	target="${pdf_dir}/$(basename "$src" .md).pdf"

	# run in the background
	# TODO: support emojis
	pandoc "${src}" -o "${target}" --pdf-engine=lualatex &
	disown
}

# view the latest note
view_latest() {
	latest=$(
		find "${pdf_dir}" \( -name "*.pdf" \) -print |
			sort -r |
			head -n 1
	)

	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		xdg-open "$latest"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		open "$latest"
	fi
}

# initialize nvim notes data
mkdir -p "${XDG_DATA_HOME}/$nvim_appname"
mkdir -p "${XDG_STATE_HOME}/$nvim_appname"
mkdir -p "${XDG_CACHE_HOME}/$nvim_appname"

# initialize variables
notes_dir="${NOTES:=${HOME}/Documents/notes}"
src_dir="${notes_dir}/src"
pdf_dir="${notes_dir}/pdf"

# ensure notes directories exist
if [ ! -d "${src_dir}" ]; then
	mkdir -p "${src_dir}"
fi
if [ ! -d "${pdf_dir}" ]; then
	mkdir -p "${pdf_dir}"
fi

# process args
case "${1}" in
"edit")
	edit_today
	;;
"build")
	build "$2"
	;;
"view")
	view_latest
	;;
*)
	exit 0
	;;
esac
