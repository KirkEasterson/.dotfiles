import subprocess
import os
from threading import Thread

from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables


class Dragon(Command):
    """A class for a "Dragon" command"""

    def execute(self):
        """The entry point"""
        th = Thread(target=self.dragondaemon, daemon=True)
        th.start()
        th.join()

    def dragondaemon(self):
        """execute the dragon-drop command"""
        arguments = f"$TERMINAL --class dragon-term -e dragon-daemon {self.args[1:]}"
        # .format(
        #     " ".join(self.args[1:])
        # )
        self.fm.execute_command(arguments)


class FzfSelect(Command):
    """
    :fzf_select
    Find a file using fzf.
    With a prefix argument to select only directories.

    See:
        - https://github.com/junegunn/fzf
        - https://github.com/ranger/ranger/wiki/Custom-Commands#fzf-integration
    """

    def execute(self):
        """The entry point"""

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
            exclude = (
                "--no-ignore-vcs"
                " --exclude '.git'"
                " --exclude '*.py[co]'"
                " --exclude '__pycache__'"
            )
            only_directories = "--type directory" if self.quantifier else ""

            fzf_default_command = (
                f"{fd} --follow {hidden} {exclude} {only_directories} --color=always"
            )
        else:
            hidden = (
                "-false" if self.fm.settings.show_hidden else r"-path '*/\.*' -prune"
            )
            exclude = (
                r"\( -name '\.git'"
                r" -o -iname '\.*py[co]'"
                r" -o -fstype 'dev'"
                r" -o -fstype 'proc' \) -prune"
            )
            only_directories = "-type d" if self.quantifier else ""
            fzf_default_command = (
                "find -L ."
                f" -mindepth 1 {hidden}"
                f" -o {exclude}"
                f" -o {only_directories}"
                " -print | cut -b3-"
            )

        env = os.environ.copy()
        env["FZF_DEFAULT_COMMAND"] = fzf_default_command
        env["FZF_DEFAULT_OPTS"] = (
            '--height=100% --layout=reverse --ansi --preview="{}"'.format(
                """
            (
                bat --color=always {} ||
                batcat --color=always {} ||
                cat {} ||
                tree -ahpCL 3 -I '.git' -I '*.py[co]' -I '__pycache__' {}
            ) 2>/dev/null | head -n 100
        """
            )
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
