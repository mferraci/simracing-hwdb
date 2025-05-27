HWDB_FILES := $(wildcard *.hwdb)
INSTALL_DIR := /etc/udev/hwdb.d

.PHONY: install remove

install:
	install -d $(INSTALL_DIR)
	install -m 644 $(HWDB_FILES) $(INSTALL_DIR)
	@echo "Don't forget to rebuild your HWDB database by launching \`systemd-hwdb update\`"

remove uninstall:
	@for file in $(HWDB_FILES); do \
		rm -f $(INSTALL_DIR)/$$file; \
	done
	@echo "Removed installed HWDB files from $(INSTALL_DIR)"
	@echo "Don't forget to rebuild your HWDB database by launching \`systemd-hwdb update\`"

help:
	@echo "Available targets:"
	@echo "  install   - Install HWDB files to $(INSTALL_DIR)"
	@echo "  remove/uninstall - Remove HWDB files from $(INSTALL_DIR)"
	@echo "  help      - Show this help message"