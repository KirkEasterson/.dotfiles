#!/usr/bin/env sh

# Taken from manjaro-sway
#
# https://github.com/manjaro-sway/desktop-settings/blob/sway/community/sway/usr/bin/inhibit-idle

status() {
  ps -ef | grep -v grep | grep -m 1 -q "systemd-inhibit --what=idle"
}

inhibit() {
  systemd-inhibit --what=idle --who=swayidle-inhibit --why=commanded --mode=block sleep "60m" &
}

uninhibit() {
  pkill -f "systemd-inhibit --what=idle" || true
}

send_signal() {
  bar-signal.sh "idle"
}

case $1'' in
  'interactive')
      MINUTES=$(echo -e "1\n10\n15\n20\n30\n45\n60\n90\n120" | rofi -dmenu -p "Select how many minutes to inhibit idle:")
      uninhibit
      inhibit $((MINUTES * 60))
      send_signal
      ;;
  'on')
      uninhibit
      inhibit 1800 # 30 minutes
      send_signal
      ;;
  'off')
      uninhibit
      send_signal
      ;;
esac

# returns data for the bar
if status; then
  class="on"
  text="Inhibiting idle (Mid click to clear)"
else
  class="off"
  text="Idle not inhibited"
fi

printf '{"alt":"%s","tooltip":"%s"}\n' "$class" "$text"
