from kitty.boss import Boss
from kittens.tui.handler import result_handler
import kitty.fast_data_types as f


def main(args: list[str]) -> str:
    pass


@result_handler(no_ui=True)
def handle_result(
    args: list[str], answer: str, target_window_id: int, boss: Boss
) -> None:
    os_window_id = f.current_focused_os_window_id()
    current_opacity = f.background_opacity_of(os_window_id)
    boss.set_background_opacity("default" if current_opacity == 1.0 else "1.0")
