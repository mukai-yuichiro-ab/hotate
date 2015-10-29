#!/usr/bin/env bash

# lib/base.theme.bash

# colored grep
export GREP_COLOR='1;33'

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

# source code manager settings
SCM_CHECK=${SCM_CHECK:=false}

SCM_THEME_PROMPT_DIRTY='✘ '
SCM_THEME_PROMPT_CLEAN='✔ '
SCM_THEME_PROMPT_BRANCH_PREFIX='('
SCM_THEME_PROMPT_BRANCH_SUFFIX=')'

SCM_GIT='GIT'
SCM_NONE='NONE'

scm__init() {
    if [[ "$SCM_CHECK" = false ]]; then SCM=$SCM_NONE
    elif [[ -f .git/HEAD ]]; then SCM=$SCM_GIT
    elif which git &> /dev/null && [[ -n "$(git rev-parse --is-inside-work-tree 2> /dev/null)" ]]; then SCM=$SCM_GIT
    fi
}

scm__prompt_status() {
    scm__init
    if [[ "$SCM" == "$SCM_GIT" ]]; then echo -e "$(scm__git_prompt_status)"
    fi
}

scm__git_prompt_status() {
    local status="$(git status --branch --porcelain 2> /dev/null)"
    local is_dirty=0
    if [[ -n "${status}" ]] && [[ "${status}" != "\n" ]] && [[ -n "$(grep -v ^# <<< "${status}")" ]]; then
        is_dirty=1
    fi

    local ref=$(git symbolic-ref -q HEAD 2> /dev/null)
    local branch=""
    if [[ -n "$ref" ]]; then
        branch="${SCM_THEME_PROMPT_BRANCH_PREFIX}${ref#refs/heads/}${SCM_THEME_PROMPT_BRANCH_SUFFIX}"
    fi

    local state="${branch}"
    if [[ "${is_dirty}" -eq 1 ]]; then
        state+="${SCM_THEME_PROMPT_DIRTY}"
    else
        state+="${SCM_THEME_PROMPT_CLEAR}"
    fi

    echo -e "${state}"
}

