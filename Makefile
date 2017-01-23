targets = swap xor

build: $(targets)

$(targets): %:%.s
	clang -o $@ $<

clean:
	rm -rf $(targets)
