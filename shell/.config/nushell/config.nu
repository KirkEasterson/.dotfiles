$env.config.show_banner = false

$env.config.edit_mode = 'vi'

# NOTE: these are handled by starship
$env.PROMPT_INDICATOR = {||""}
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.config.cursor_shape.vi_insert = "blink_line"
$env.config.cursor_shape.vi_normal = "block"

$env.PROMPT_COMMAND_RIGHT = ""

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
