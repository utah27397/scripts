.DEFAULT_GOAL := build

SOURCE_COMMIT := 8d0d0331487da879e25e4f4530ddf761cf4310eb
TARGET_DFHACK := 0.47.05-r8
MANIFEST ?= manifests/backport-scripts.txt
BUILD_DIR ?= build
OUTPUT_DIR ?= $(BUILD_DIR)/scripts
PREFIX ?= hack/scripts

.PHONY: build check-source clean install source-info

check-source:
	@set -eu; \
	for required in README.md "$(MANIFEST)"; do \
		if [ ! -e "$$required" ]; then \
			echo "missing source file: $$required" >&2; \
			exit 1; \
		fi; \
	done; \
	while IFS= read -r script || [ -n "$$script" ]; do \
		case "$$script" in ''|\#*) continue ;; esac; \
		if [ ! -f "$$script" ]; then \
			echo "missing backport script: $$script" >&2; \
			exit 1; \
		fi; \
	done < "$(MANIFEST)"

source-info: check-source
	@set -eu; \
	echo "source branch:    scripts-backport/0.47.05-r8"; \
	echo "source commit:    $(SOURCE_COMMIT)"; \
	echo "target dfhack:    $(TARGET_DFHACK)"; \
	echo "selected scripts: $$(awk 'NF && $$1 !~ /^#/' "$(MANIFEST)" | wc -l)"

build: check-source
	@set -eu; \
	case "$(OUTPUT_DIR)" in ""|"/"|".") \
		echo "unsafe OUTPUT_DIR: $(OUTPUT_DIR)" >&2; \
		exit 1 ;; \
	esac; \
	rm -rf "$(OUTPUT_DIR)"; \
	mkdir -p "$(OUTPUT_DIR)"; \
	while IFS= read -r script || [ -n "$$script" ]; do \
		case "$$script" in ''|\#*) continue ;; esac; \
		mkdir -p "$(OUTPUT_DIR)/$$(dirname "$$script")"; \
		cp -a "$$script" "$(OUTPUT_DIR)/$$script"; \
	done < "$(MANIFEST)"

install: build
	@set -eu; \
	if [ -z "$${DESTDIR:-}" ]; then \
		echo "DESTDIR is required" >&2; \
		exit 1; \
	fi; \
	mkdir -p "$$DESTDIR/$(PREFIX)"; \
	cp -a "$(OUTPUT_DIR)/." "$$DESTDIR/$(PREFIX)/"

clean:
	rm -rf "$(BUILD_DIR)"
