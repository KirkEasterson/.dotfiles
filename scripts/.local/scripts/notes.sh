#!/usr/bin/env bash

set -eo pipefail

notes_dir="${NOTES:=${HOME}/Documents/notes}"
src_dir="${notes_dir}/src"
pdf_dir="${notes_dir}/pdf"

today_subdir() {
  date +%Y/%m
}

today_srcdir() {
  echo "${src_dir}/$(today_subdir)"
}

today_pdfdir() {
  echo "${pdf_dir}/$(today_subdir)"
}

ensure_today_srcdir_exists() {
  mkdir -p "$(today_srcdir)"
}

ensure_today_pdfdir_exists() {
  echo "making today pdf dir"
  mkdir -p "$(today_pdfdir)"
}

today_file() {
  echo "note_$(date +%Y-%m-%d).md"
}

today_src_path() {
  echo "$(today_srcdir)/$(today_file)"
}

# edit toay's note
edit_today() {
  ensure_today_srcdir_exists
  today_note_file="$(today_src_path)"
  now=$(date +%H:%M:%S)

  # check if file exists
  if [ ! -f "${today_note_file}" ]; then
    printf "# Notes for %s" "$(date +%Y-%m-%d)" >"${today_note_file}"
  fi

  vim \
    -c "norm Go" \
    -c "norm Go## ${now}" \
    -c "norm G2o" \
    -c "startinsert" "${today_note_file}"
}

# build a specified note
build() {
  ensure_today_srcdir_exists
  ensure_today_pdfdir_exists
  subdir=$(today_subdir)
  today_note_dir="${pdf_dir}/${subdir}"

  src="$1"
  target="${today_note_dir}/$(basename "$src" .md).pdf"

  # run in the background
  # TODO: support emojis
  pandoc "${src}" -o "${target}" --pdf-engine=lualatex &
  disown
}

# view the latest note
view_latest() {
  ensure_today_pdfdir_exists
  year=$(date +%Y)
  month=$(date +%m)

  today_note_dir="${pdf_dir}/${year}/${month}"

  latest=$(
    find "${today_note_dir}" \( -name "*.pdf" \) -print |
      sort -r |
      head -n 1
  )

  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "$latest"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    open "$latest"
  fi
}

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
