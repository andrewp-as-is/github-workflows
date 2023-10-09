all:
	find -H ~/git -type d -mindepth 1 -maxdepth 1 -exec bash -l $(CURDIR)/scripts/init.sh {} \;
