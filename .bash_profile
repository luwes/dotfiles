export BASH_SILENCE_DEPRECATION_WARNING=1

# Add `~/bin` to the `$PATH`
export PATH=$HOME/bin:$PATH;
export PATH=/usr/local/Cellar/python@2/2.7.15/bin/python:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source /usr/local/etc/bash_completion.d/git-completion.bash

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wes/google-cloud-sdk/path.bash.inc' ]; then . '/Users/wes/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wes/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/wes/google-cloud-sdk/completion.bash.inc'; fi

# vimeo-dev-cli-autocomplete-start
if [ -f '/Users/wes/Sites/vimeo/vimeo/scripts/devex/DevCli/dev-cli-completer-bash' ]; then
    source /Users/wes/Sites/vimeo/vimeo/scripts/devex/DevCli/dev-cli-completer-bash
fi
# vimeo-dev-cli-autocomplete-end

# vimeo-dev-alias-start
alias dev=/Users/wes/Sites/vimeo/vimeo/dev
# vimeo-dev-alias-end
