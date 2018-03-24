## Repository for my jorijn.com website

It's based on [jasper2](https://github.com/jekyller/jasper2). I did some own modifications.

### Build scripts
I took the Makefile build script and some caching improvements from [mijndertstuij.nl](https://github.com/mijndert/mijndertstuij.nl). Thanks 🙂

### Syntax highlighting
This seemed broken in the original repository, I fixed this by creating an additional `code.css` file. You can check which themes are available using:

```bash
$ rougify help style
usage: rougify style [<theme-name>] [<options>]

Print CSS styles for the given theme.  Extra options are
passed to the theme.  Theme defaults to thankful_eyes.

options:
  --scope	(default: .highlight) a css selector to scope by

available themes:
  base16, base16.dark, base16.light, base16.monokai, base16.monokai.dark, base16.monokai.light, base16.solarized, base16.solarized.dark, base16.solarized.light, colorful, github, gruvbox, gruvbox.dark, gruvbox.light, igorpro, molokai, monokai, monokai.sublime, thankful_eyes, tulip
```

Then output the styling into the `code.css` file:

```bash
$ rougify style monokai > assets/css/code.css
```

Now rebuild the assets;

```bash
$ gulp build
``` 