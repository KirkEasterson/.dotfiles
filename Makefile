.PHONY: install
install:
	stow -S */ --adopt

.PHONY: lint
lint: lint-lua

.PHONY: lint-lua
lint-lua:
	@docker compose run -q --rm stylua ./stylua \
		--check \
		--allow-hidden \
		--output-format=summary \
		-f /src/formatters/.config/stylua/stylua.toml \
		/data/
