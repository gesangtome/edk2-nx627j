.PHONY: clean

clean:
	@find . -maxdepth 1 -type f -name "*.img" -exec rm -r -f {} \;

