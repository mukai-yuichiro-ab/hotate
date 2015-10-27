#!/usr/bin/env bash

# lib/base.theme.bash

# colored grep
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

THEME_PROMPT_HOST='\H'

# source code manager settings

SCM_CHECK=${SCM_CHECK:=true}

# SCM_THEME_PROMPT_CLEAN=' '
# SCM_THEME_PROMPT_DIRTY=' ✘'

SCM_GIT='GIT'
SCM_NONE='NONE'

scm__init() {
    if [[ "$SCM_CHECK" = false ]]; then SCM=$SCM_NONE
    elif [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
    elif which git &> /dev/null && [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then SCM=$SCM_GIT
    fi
}

scm__propmt_info() {
    scm__init
}
