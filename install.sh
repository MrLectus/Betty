#!/bin/env bash

if [[ ! "$(command -v man)" ]]; then
  pkg install man
fi

if [[ ! "$(command -v perl)" ]]; then
  pkg install perl
fi

if (( $? != 0 )); then
  exit -1
fi

# no need to check root
# if [ "$(id -u)" != "0" ]
# then
# 	echo "Sorry, you are not root."
# 	exit 1
# fi

BETTY_STYLE="betty-style"
BETTY_DOC="betty-doc"
BETTY_WRAPPER="betty"

APP_PATH="${PREFIX}/bin"
BIN_PATH="${HOME}/.local/bin"
MAN_PATH="${PREFIX}/share/man"

echo -e "Installing binaries.."

mkdir -p "$BIN_PATH"
mkdir -p "$APP_PATH"

cp "${BETTY_STYLE}.pl" "${APP_PATH}/${BETTY_STYLE}"
cp "${BETTY_DOC}.pl" "${APP_PATH}/${BETTY_DOC}"
cp "${BETTY_WRAPPER}.sh" "${APP_PATH}/${BETTY_WRAPPER}"

chmod +x "${APP_PATH}/${BETTY_STYLE}"
chmod +x "${APP_PATH}/${BETTY_DOC}"
chmod +x "${APP_PATH}/${BETTY_WRAPPER}"

ln -s "${APP_PATH}/${BETTY_STYLE}" "${BIN_PATH}/${BETTY_STYLE}"
ln -s "${APP_PATH}/${BETTY_DOC}" "${BIN_PATH}/${BETTY_DOC}"
ln -s "${APP_PATH}/${BETTY_WRAPPER}" "${BIN_PATH}/${BETTY_WRAPPER}"

echo -e "Installing man pages.."

mkdir -p "$MAN_PATH"

cp "man/betty.1" "$MAN_PATH"
cp "man/${BETTY_STYLE}.1" "$MAN_PATH"
cp "man/${BETTY_DOC}.1" "$MAN_PATH"

echo -e "All set."
