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

	# Disabled the subversion messages because it seems to slow the shell and
	# replaced it with a shell command that gets the revision number using
	# svn info, grep and awk
	# printf ' %s' (fish_svn_prompt)
    set_color white
		printf ' %s' (svn info 2>/dev/null | grep Revision | awk '{print "("$2")"}')
    set_color normal

    # Line 2
    echo
    if test -n "$VIRTUAL_ENV"
        printf "(%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
    end
    printf '↪ '
    set_color normal
end
