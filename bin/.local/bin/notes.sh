#!/bin/bash

# edit toay's note
edit_today () {
	today=$(date +%Y-%m-%d)
	today_note_file="${src_dir}/note-${today}.md"

	# check if file exists
	if [ ! -f "${today_note_file}" ]; then
		printf "# Notes for %s" "${today}" > "${today_note_file}"
	fi

	# insert subheading for this insert
	printf "\n## %s\n\n\n" "$(date +%H:%M:%S)" >> "${today_note_file}"

	# edit the note
	$TERMINAL -e nvim + -c "startinsert" "${today_note_file}" & disown
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
	find "${pdf_dir}" \( -name "*.pdf" \) -print \
		| sort -r \
		| head -n 1 \
		| xargs xdg-open & disown
}

# initialize variables
notes_dir="${NOTES:=${HOME}/Documents/notes}"
src_dir="${notes_dir}/src"
pdf_dir="${notes_dir}/pdf"

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
