#!/usr/bin/env bash

# lib/minimal.theme.bash

SCM_CHECK=true

prompt_command() {
    local status=$?

    local git="$(text_style cyan)$(scm__prompt_status)$(text_style reset)"
    local dir="$(text_style magenta)(\W)$(text_style reset)"
    local prompt="$(if [ "${USER-}" = "root" ]; then echo "#"; else echo "\$"; fi)" 
    if [[ "$status" -gt 0 ]]; then
        prompt="$(text_style bold white) [${status}] $(text_style reset red)${prompt} $(text_style reset)"
    else
        prompt="$(text_style green)${prompt}$(text_style reset)"
    fi

    PS1="${git} ${dir}\n${prompt} "
}

PROMPT_COMMAND=prompt_command
