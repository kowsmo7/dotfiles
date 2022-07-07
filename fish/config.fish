function fish_prompt
		echo (set_color purple)(whoami)'@'(prompt_hostname)(set_color white):(set_color blue)(prompt_pwd --full-length-dirs=31)(set_color white)'$'' '
end

function fish_greeting
end

set FZF_DEFAULT_COMMAND 'fd --type f'

fish_add_path "/home/bracks/bin/"
fish_add_path "/home/bracks/.cargo/bin"
