# Slugify

Slugify is an [Ash](https://github.com/ash-shell/ash) module that allows you to convert strings into slugs.

## Getting started

You're going to have to install [Ash](https://github.com/ash-shell/ash) to use this module.

After you have Ash installed, run either one of these two commands depending on your git clone preference:

- `ash apm:install https://github.com/ash-shell/slugify.git`
- `ash apm:install git@github.com:ash-shell/slugify.git`

You can optionally install this globally by adding `--global` to the end of the command.

## Usage

You can either call Slugify straight from the command line, or as an imported library.

### Command Line Usage

Check out the [HELP.txt](HELP.txt) file for command line usage.  You can also run `ash slugify:help` in the terminal.

### Imported Library Usage

Before you can use Slugify in your modules, you must import it:

```bash
Ash__import "github.com/ash-shell/slugify"
```

After including this library, you are free to start using it.

##### Slugify__slugify

The main function available in this library is `Slugify__slugify`.  Here is some example usage:

```sh
slug="$(Slugify__slugify "Some String")"
echo "$slug"
```

Will output:

```sh
some-string
```

## License

[MIT](LICENSE.md)
