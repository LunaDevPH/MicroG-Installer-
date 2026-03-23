# MicroG-Installer Magisk Module Makefile

NAME = MicroG-Installer
VERSION = $(shell grep "version=" module.prop | cut -d= -f2)
ZIP_NAME = $(NAME)-v$(VERSION).zip

all: clean zip

zip:
	@echo "Building Magisk Module: $(ZIP_NAME)"
	zip -r $(ZIP_NAME) config.sh post-fs-data.sh module.prop system/
	@echo "Build complete."

clean:
	@echo "Cleaning up..."
	rm -f *.zip
	@echo "Done."

.PHONY: all zip clean
