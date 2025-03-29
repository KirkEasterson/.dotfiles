config.load_autoconfig(True)

c.auto_save.session = True
c.changelog_after_upgrade = "minor"
c.confirm_quit = ["downloads"]
c.content.autoplay = False
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "auto"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?ia=web&q={}",
    "!d": "https://duckduckgo.com/?ia=web&q={}",
    "!g": "https://google.com/search?hl=en&q={}",
    "!gh": "https://github.com/{}",
    "!ghs": "https://github.com/search?o=desc&q={}&s=stars",
    "!yt": "https://www.youtube.com/results?search_query={}",
    "!m": "https://www.google.com/maps/search/{}",
    "!w": "https://en.wikipedia.org/wiki/{}",
    "!dd": "https://thefreedictionary.com/{}",
    "!t": "https://www.thesaurus.com/browse/{}",
    "!e": "https://www.ebay.com/sch/i.html?_nkw={}",
}

config.bind("<Ctrl-Y>", "command-accept", mode="command")
config.bind("<Ctrl-P>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-N>", "completion-item-focus next", mode="command")

config.bind(",m", "spawn umpv.py {url}")
config.bind(",M", "hint links spawn umpv {hint-url}")
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")

config.source("gruvbox.py")
