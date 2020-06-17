# mkpassword

**Randomly generate alphanumeric or XKCD-style passwords**


## Usage

Generate an alphanumeric password, excluding similar looking characters:

```bash
$ mkpassword
YWF9NqsGmy2DHG
```

Generate an [XKCD-style password](https://xkcd.com/936/), from the words
stored in `/usr/share/dict/words`:

```bash
$ mkxkcdpassword
zoologer cordwood cripple visibly tinger
```


## Dependencies

- bash or zsh as your shell


## Setup

1. Ensure you have these dependencies above

2. Clone this repo

3. Add `source /path/to/mkpassword.sh` to `.profile`

4. Add `source /path/to/mkxkcdpassword.sh` to `.profile`


## Password entropy

For an alphanumeric password, assuming knowledge of the generation algorithm:

```
char_pool = 62
num_chars = 14

entropy = log2(char_pool ^ num_chars)
        = log2(62 ^ 14)
        ~= 83 bits
```

For an XKCD-style password, assuming knowledge of the generation algorithm:

```
word_pool = 121049
num_words = 5

entropy = log2(word_pool ^ num_words)
        = log2(121049 ^ 5)
        ~= 84 bits
```

