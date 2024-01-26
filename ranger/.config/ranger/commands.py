from ranger.api.commands import *
from threading import Thread


class dragon(Command):
    def execute(self):
        th = Thread(target=self.dragondaemon, daemon=True)
        th.start()
        th.join()

    def dragondaemon(self):
        arguments = "$TERMINAL --class dragon-term -e dragon-daemon {}".format(
            " ".join(self.args[1:])
        )
        self.fm.execute_command(arguments)


# https://github.com/ranger/ranger/wiki/Custom-Commands#fzf-integration
class fzf_select(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument to select only directories.

    See: https://github.com/junegunn/fzf
    """

    def execute(self):
        import subprocess
        import os
        from ranger.ext.get_executables import get_executables

        if "fzf" not in get_executables():
            self.fm.notify("Could not find fzf in the PATH.", bad=True)
            return

        fd = None
        if "fdfind" in get_executables():
            fd = "fdfind"
        elif "fd" in get_executables():
            fd = "fd"

        if fd is not None:
            hidden = "--hidden" if self.fm.settings.show_hidden else ""
            exclude = "--no-ignore-vcs --exclude '.git' --exclude '*.py[co]' --exclude '__pycache__'"
            only_directories = "--type directory" if self.quantifier else ""
            fzf_default_command = "{} --follow {} {} {} --color=always".format(
                fd, hidden, exclude, only_directories
            )
        else:
            hidden = (
                "-false" if self.fm.settings.show_hidden else r"-path '*/\.*' -prune"
            )
            exclude = r"\( -name '\.git' -o -iname '\.*py[co]' -o -fstype 'dev' -o -fstype 'proc' \) -prune"
            only_directories = "-type d" if self.quantifier else ""
            fzf_default_command = (
                "find -L . -mindepth 1 {} -o {} -o {} -print | cut -b3-".format(
                    hidden, exclude, only_directories
                )
            )

        env = os.environ.copy()
        env["FZF_DEFAULT_COMMAND"] = fzf_default_command
        env[
            "FZF_DEFAULT_OPTS"
        ] = '--height=100% --layout=reverse --ansi --preview="{}"'.format(
            """
            (
                bat --color=always {} ||
                batcat --color=always {} ||
                cat {} ||
                tree -ahpCL 3 -I '.git' -I '*.py[co]' -I '__pycache__' {}
            ) 2>/dev/null | head -n 100
        """
        )

        fzf = self.fm.execute_command(
            "fzf --no-multi", env=env, universal_newlines=True, stdout=subprocess.PIPE
        )
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            selected = os.path.abspath(stdout.strip())
            if os.path.isdir(selected):
                self.fm.cd(selected)
            else:
                self.fm.select_file(selected)


class YankContent(Command):
    """
    Copy the content of image file and text file with xclip
    """

    def execute(self):
        import os
        import subprocess
        from ranger.container.file import File
        from ranger.ext.get_executables import get_executables

        if "xclip" not in get_executables():
            self.fm.notify("xclip is not found.", bad=True)
            return

        arg = self.rest(1)
        if arg:
            if not os.path.isfile(arg):
                self.fm.notify("{} is not a file.".format(arg))
                return
            file = File(arg)
        else:
            file = self.fm.thisfile
            if not file.is_file:
                self.fm.notify("{} is not a file.".format(file.relative_path))
                return

        relative_path = file.relative_path
        cmd = ["xclip", "-selection", "clipboard"]
        if not file.is_binary():
            with open(file.path, "rb") as fd:
                subprocess.check_call(cmd, stdin=fd)
        elif file.image:
            cmd += ["-t", file.mimetype, file.path]
            subprocess.check_call(cmd)
            self.fm.notify(
                "Content of {} is copied to x clipboard".format(relative_path)
            )
        else:
            self.fm.notify(
                "{} is not an image file or a text file.".format(relative_path)
            )

    def tab(self, tabnum):
        return self._tab_directory_content()
