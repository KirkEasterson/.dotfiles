# dotfiles

Repository for my linux/macOS dotfiles, managed by GNU stow.

# Prerequisites

- [stow](https://www.gnu.org/software/stow/)

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
stow vim
```
