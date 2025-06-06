$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""

$env.config.edit_mode = 'vi'
