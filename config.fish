abbr -a n nvim
abbr -a e emacsclient -t
abbr -a dnfu sudo dnf upgrade
abbr -a inst sudo dnf install
abbr -a b bash

# PATH
set PATH $PATH /home/bassam/anaconda3/bin 
set EDITOR nvim

# Conda source
 source /home/bassam/anaconda3/etc/fish/conf.d/conda.fish

# Fish prompt
function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color -o blue
    #echo -n (whoami)
	#echo -n "@"
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color -o yellow
		echo -n ':'
		echo -n (basename $PWD)
	end
	set_color purple -o
	printf '%s ' (__fish_git_prompt)
	set_color magenta -o
	echo -n '| '
	set_color normal
end

function fish_greeting
	echo
	echo -e (uname -ro | awk '{print " \\\\e[1mOS: \\\\e[36m"$0"\\\\e[0m"}')
	echo -e (uptime -p | sed 's/^up //' | awk '{print " \\\\e[1mUptime: \\\\e[36m"$0"\\\\e[0m"}')
	echo -e (uname -n | awk '{print " \\\\e[1mHostname: \\\\e[36m"$0"\\\\e[0m"}')
	echo -e (iwgetid -r | awk '{print " \\\\e[1mNetwork: \\\\e[36m"$0"\\\\e[0m"}')
	echo
	set_color normal

end

function fish_title
    if [ $_ = 'fish' ]
        echo (whoami)
        echo @
        echo (hostname)
        echo ": "
        echo (prompt_pwd)
    else
        echo (whoami)
        echo @
        echo (hostname)
        echo ": "
        echo (prompt_pwd)
        echo " — "
        echo $_

    end
end
