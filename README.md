## Swapping variables: XOR vs temp variable

I created this repo to address a question I had a long time ago. Is it faster to use a temp variable for swapping two ints or use xor?

Given:

```
int i = 0;
int j = 1;
```

Which is faster?

```
int tmp;

tmp = i;
i = j;
j = tmp;
```

or 

```
i ^= j;
j ^= i;
i ^= j;
```

## The answer

They're effectively the same

### The methodology

We write the assembly directly to ensure the code is running as we expect. We use the instruction ```rdtscp``` to get the actual processor time. According to the Intel docs this is accurate for small chunks of performance testing (where "small" is undefined but this is surely within that range since both options are three instructions). 

### To replicate
Requires Linux to build (would build on OS X with a couple of changes to the section names). Tested on Debian Jessie

```
make # Uses clang in Makefile. Switch to your favorite compiler if you don't have clang
```

As root user:

```
./swap
```

```
./xor
```

We use root since the OS may have set the processor control flags to only allow use of the ```rdtscp``` instruction by root. 
