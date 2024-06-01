#!/bin/bash

# edit toay's note
edit_today () {
	# check if file exists
	if [ ! -f "${today_note_file}" ]; then
		printf "# Notes for %s" "${today}" > "${today_note_file}"
	fi

	# insert subheading for this insert
	printf "\n\n## %s\n\n" "$(date +%H:%M:%S)" >> "${today_note_file}"

	# edit the note
	$TERMINAL -e nvim + -c "startinsert" "${today_note_file}"
}

# build a specified note
build () {
	src="$1"
	target="${pdf_dir}/$(basename "$src" .md).pdf"

	# run in the background
	# TODO: support emojis
	pandoc "${src}" -o "${target}" --pdf-engine=lualatex & disown
}

# view the latest note
view_latest () {
	latest=$(find "${pdf_dir}" \( -name "*.pdf" \) -print0 -quit)
	xdg-open "$latest"
}

# initialize variables
notes_dir="${NOTES:=${HOME}/Documents/notes}"
src_dir="${notes_dir}/src"
pdf_dir="${notes_dir}/pdf"
today=$(date +%Y-%m-%d)
today_note_file="${src_dir}/note-${today}.md"

# ensure notes directory exists
mkdir -p "${src_dir}"
mkdir -p "${pdf_dir}"

# process args
case "${1}" in
	("edit")
		edit_today
		;;
	("build")
		build "$2"
		;;
	("view")
		view_latest
		;;
	(*)
		exit 0
esac
