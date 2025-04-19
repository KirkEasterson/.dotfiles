# dotfiles
Repository for my linux/macOS dotfiles, managed by GNU stow.

# Prerequisites
- `stow`

# Installation

### Install everything

Run the following command:

```
./install.sh
```

There may be conflicts with certain files (e.g. `.bashrc`, `.profile`, etc). In that case, the conflicting files won't be sym-linked. The original file must be removed if the file from this repository is to be used. After removing/renaming the conflicting file, running the install script again will create the new sym-link.

### Install individual files

Use `stow`:

```
stow wezterm
```

### Firefox

I've found the following repository to be sufficient for my firefox theme, though I've made some slight changes. Ideally this would be version controlled like the other configs, but this isn't straight-forward for firefox.

- https://github.com/Dook97/firefox-qutebrowser-userchrome

# Roadmap

- [ ] automate firefox css, possibly in a separate repo
