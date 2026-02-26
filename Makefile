.PHONY: all homebrew zsh neovim github

DOTFILES_DIR := $(shell pwd)

all:
	@echo "Installing dotfiles..."
	$(MAKE) homebrew
	$(MAKE) zsh
	$(MAKE) neovim
	$(MAKE) github

homebrew:
	@if ! command -v brew >/dev/null 2>&1; then \
		echo "Installing Homebrew..."; \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew already installed, skipping."; \
	fi
	@echo "Installing brew packages..."
	brew bundle install

zsh:
	@echo "Installing oh-my-zsh..."
	@if [ ! -d "$$HOME/.oh-my-zsh" ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended; \
	else \
		echo "  oh-my-zsh already installed, skipping."; \
	fi
	@echo "Linking zsh configuration..."
	ln -sf $(DOTFILES_DIR)/home_dir/.zshrc ~/
	ln -sf $(DOTFILES_DIR)/home_dir/.zshenv ~/
	ln -sf $(DOTFILES_DIR)/home_dir/.tmux.conf ~/
	@echo "Linking shell helper scripts..."
	mkdir -p ~/.files
	@for f in $(DOTFILES_DIR)/home_dir/.files/*; do \
		target="$$HOME/.files/$$(basename "$$f")"; \
		if [ -d "$$target" ] && [ ! -L "$$target" ]; then \
			rm -rf "$$target"; \
		fi; \
		ln -sfn "$$f" ~/.files/; \
	done
	@echo "Linking custom bin scripts..."
	mkdir -p ~/bin
	@for f in $(DOTFILES_DIR)/home_dir/bin/*; do \
		ln -sf "$$f" ~/bin/; \
	done

neovim:
	@echo "Linking nvim configuration..."
	mkdir -p ~/.config
	ln -sfn $(DOTFILES_DIR)/nvim ~/.config/nvim

github:
	@echo "Configuring github..."
	ln -sf $(DOTFILES_DIR)/home_dir/.gitconfig ~/
	mkdir -p ~/.gnupg
	@echo "pinentry-program $$(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
