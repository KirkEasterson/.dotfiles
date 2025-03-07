config.load_autoconfig(True)

c.auto_save.session = True
c.changelog_after_upgrade = "minor"
c.confirm_quit = ["downloads"]
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "auto"

config.bind("<Ctrl-Y>", "command-accept", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-N>", "completion-item-focus next", mode="command")

config.source("gruvbox.py")
