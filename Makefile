.PHONY: install
install:
	stow -S */ --adopt

.PHONY: lint
lint: lint-lua lint-yaml lint-markdown

.PHONY: lint-lua
lint-lua:
	@docker compose run -q --rm stylua ./stylua \
		--check \
		--allow-hidden \
		--output-format=summary \
		-f /data/formatters/.config/stylua/stylua.toml \
		/data/

.PHONY: lint-yaml
lint-yaml:
	@docker compose run -q --rm yamllint yamllint \
		--config-file ./formatters/.config/yamllint/config \
		.

.PHONY: lint-markdown
lint-markdown:
	@docker compose run -q --rm markdownlint mdl \
		-c ./formatters/.config/markdownlint/mdlrc \
		.
