# dotfiles

Repository for my linux/macOS dotfiles, managed by GNU stow.

## _Mirrors_

All commits are pushed to [codeberg](https://codeberg.org/kirkeasterson/.dotfiles),
with [github](https://github.com/KirkEasterson/.dotfiles) as a mirror.

## Prerequisites

- [stow](https://www.gnu.org/software/stow/)

## Installation

### Install everything

Run the following command:

```bash
make install
```

There may be conflicts with certain files (e.g. `.bashrc`, `.profile`, etc). In
that case, the conflicting files won't be sym-linked. The original file must be
removed if the file from this repository is to be used. After removing/renaming
the conflicting file, running the install script again will create the new
sym-link.

### Install individual files

Use `stow`:

```bash
stow vim
```
