# Defined interactively
function fish_prompt
    if not set -q VIRTUAL_ENV_DISABLE_PROMPT
        set -g VIRTUAL_ENV_DISABLE_PROMPT true
    end
    set_color bryellow
		set_color -b blue
    printf ' \uf007 %s ' $USER
		set_color blue
		set_color -b green
		printf '\uE0B0'

    set_color brwhite
		set_color -b green
		printf ' \uf233 %s ' (prompt_hostname)
    set_color green
		set_color -b magenta
    printf '\uE0B0'

    set_color brcyan
		set_color -b magenta
    printf ' \uf07b %s ' (prompt_pwd)
    set_color normal
		set_color magenta
		printf '\uE0B0'

    set_color white
    printf '%s' (fish_git_prompt)
    set_color normal

	# Disabling the subversion messages because it seems to slow the shell
	# printf ' %s' (fish_svn_prompt)

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
