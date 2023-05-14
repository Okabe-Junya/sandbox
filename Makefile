.PHONY: clean
clean:
	@rm -f *.o *.out

gitkeep:
	@find . -type d -empty -exec touch {}/.gitkeep \;
