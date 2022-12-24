# # init keyring
# eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
# # export keyring
# export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK


eval $(dbus-launch --sh-syntax)
unclutter &
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec awesome
