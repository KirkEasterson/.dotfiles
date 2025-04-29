#!/bin/sh

# various floating window rules
riverctl rule-add -title "Open As" float
riverctl rule-add -title "Open File" float
riverctl rule-add -title "Open Folder" float
riverctl rule-add -title "Open" float
riverctl rule-add -title "Save As" float
riverctl rule-add -title "Save File" float
riverctl rule-add -title "Save Folder" float
riverctl rule-add -title "Save" float

riverctl rule-add -title "Logg på" float

riverctl rule-add -title "*User Agreement*" float

riverctl rule-add -title "Torrent Options" float

riverctl rule-add -title "Bluetooth Devices" float
riverctl rule-add -app-id "dragon-drop" float
riverctl rule-add -app-id "com-atlauncher-App" float
riverctl rule-add -title "webcam-on-screen" float

riverctl rule-add -app-id "firefox" -title "Library" float
riverctl rule-add -app-id "thunderbird" -title "*Reminder" float

# manually set server-side-decorations for everything
riverctl rule-add -app-id "*" ssd
