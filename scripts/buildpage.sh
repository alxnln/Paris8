#!/bin/bash

function buildpage {
	cat layout/before.html
	cat "${1}"
	cat layout/after.html
}

if [[ "${1}" = "" ]]; then
	echo "Usage: ${0} PAGE" >&2
	exit 1
elif test ! -f "${1}"; then
	echo "${0}: error: ${1}: no such file" >&2
	exit 1
else
	FILE="${1#pages/}"
	buildpage "${1}" > "public/${FILE}"
fi

function FILE {
	index.html
}
function TITLE {
	cat ../layout/before.html | sed "s~ ~~"
}
function DATE {
	
