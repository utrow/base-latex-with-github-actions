.PHONY: setup pdf

DOCUMENT_DIR := document
DOCUMENT_MAIN := main.tex
BUILD_DIR := build
DOCKER_IMAGE := utrow/base-latex-with-github-actions

HEADER_SPACER := =============================================
SPACER := \n---------------------------------------------\n

SLACK_TOKEN := ENTER_YOUR_SLACK_BOT_TOKEN
SLACK_CHANNEL := ENTER_YOUR_SLACK_CHANNEL
SLACK_FILENAME := thesis_$(shell date '+%Y-%m-%d_%H-%M-%S').pdf;

all: pdf

pdf:
	@echo $(HEADER_SPACER)
	@echo "  📝 Making Document PDF: $(DOCUMENT_DIR)/$(DOCUMENT_MAIN)"
	@echo $(HEADER_SPACER)
	@echo "\n▶️  Building docker..."
	docker build -t $(DOCKER_IMAGE) .
	@echo "\n▶️  Mounting... $(shell pwd)/$(DOCUMENT_DIR)"
	@echo "\n▶️  Building document...\n"
	docker run --rm -v $(shell pwd)/$(BUILD_DIR):/workdir/build \
		-e TZ=Asia/Tokyo $(DOCKER_IMAGE) $(DOCUMENT_MAIN)
	@echo "$(SPACER)"
	@echo " 🎁  Output to $(BUILD_DIR)/main.pdf\n"

upload:
	curl -X POST https://slack.com/api/files.upload \
	-F token=$(SLACK_TOKEN) \
	-F channels=$(SLACK_CHANNEL) \
	-F pretty=1 \
	-F file=@build/main.pdf \
	-F filename=$(SLACK_FILENAME)
