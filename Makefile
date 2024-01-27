all:
	echo "Installing dotfiles..."
	make brew
	make zsh
	make neovim
homebrew:
	echo "Installing requirements..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo "Installing brew packages..."
	brew bundle install
zsh:
	echo "Installing oh-my-zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp ./home_dir/.zshrc ~/
	cp -r ./home_dir/.files ~/
	cp -r ./home_dir/.tmux.conf ~/
neovim:
	echo "Linking nvim configuration..."
	ln -s ~/.files/nvim ~/.config/nvim
github:
	echo "Configuring github..."
	cp ./home_dir/.gitconfig ~/
	echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf

