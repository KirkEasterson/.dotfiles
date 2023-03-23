#!/usr/bin/env bash

SOURCE=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleCurrentKeyboardLayoutInputSourceID)

case ${SOURCE} in
'com.apple.keylayout.Norwegian') LABEL='no' ;;
'com.apple.keylayout.Swedish') LABEL='se' ;;
'com.apple.keylayout.US') LABEL='us' ;;
'com.apple.keylayout.ABC') LABEL='us' ;;
esac

sketchybar --set $NAME label="$LABEL"
