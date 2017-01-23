targets = swap xor

$(targets) :%s:
	clang -o $@ $<

build: $(targets)

clean:
	rm -rf $(targets)
