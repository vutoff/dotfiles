.PHONY: all homebrew zsh neovim ghostty github

DOTFILES_DIR := $(shell pwd)

all:
	@echo "Installing dotfiles..."
	$(MAKE) homebrew
	$(MAKE) zsh
	$(MAKE) neovim
	$(MAKE) ghostty
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
	@echo "Installing oh-my-zsh custom plugins..."
	@for repo in zsh-users/zsh-syntax-highlighting zsh-users/zsh-autosuggestions Aloxaf/fzf-tab; do \
		dest="$$HOME/.oh-my-zsh/custom/plugins/$$(basename $$repo)"; \
		if [ ! -d "$$dest" ]; then git clone --depth=1 https://github.com/$$repo "$$dest"; \
		else echo "  $$(basename $$repo) already installed, skipping."; fi; \
	done
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

ghostty:
	@echo "Linking ghostty configuration..."
	mkdir -p ~/.config/ghostty
	ln -sf $(DOTFILES_DIR)/home_dir/ghostty_config ~/.config/ghostty/config

github:
	@echo "Configuring github..."
	ln -sf $(DOTFILES_DIR)/home_dir/.gitconfig ~/
	mkdir -p ~/.gnupg
	@echo "pinentry-program $$(brew --prefix)/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
