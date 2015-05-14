# Ash Slugify

Ash-Slugify is an [Ash](https://github.com/BrandonRomano/ash) module that allows you to convert strings into slugs.

## Getting started

### Ash Users

Ash-Slugify is part of the Ash core, so you won't need to install it.

You can either call Ash-Slugify straight from the command line, or as an imported library.

#### Command Line Usage

```sh
ash slugify "Some, String"
```

Will output:

```sh
<< Slugify >>: some-string
```

#### Module Usage

Ash-Slugify is part of the Ash core, but you will still need to import it into your modules.

Add this line to the top of any file called from Ash:

```bash
Ash_import "slugify"
```

After including this library, you are free to start using it.

The main function that you'll want to use is `Slugify__slugify`.  Here is some example usage:

```sh
slug="$(Slugify__slugify "Some, String")"
echo "$slug"
```

Will output:

```sh
some-string
```

### Non Ash Users

Follow the same usage as described in "Module Usage", but instead of using `Ash_import "slugify"` use `. {path_to_slugify}/lib/slugify.sh`.

## License

[MIT](LICENSE.md)
