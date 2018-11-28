# wren-warble

A robust and simple policy-based logging utility for [Wren](https://github.com/wren-lang/wren).


## Features

### TODO


## Getting Started

The [source](https://github.com/datatypevoid/wren-warble/blob/develop/src) files should be dropped into an existing project and the top module imported:

```wren
import "./relative/path/to/wren-warble/logger" for Logger
```

Additionally, the dependencies listed in the [package.toml](https://github.com/datatypevoid/wren-warble/blob/develop/package.toml) file should be cloned/downloaded and dropped in a directory named `wren_modules` (create it if it doesn't exist).

> The `wren-test` dependency is only needed if you intend on running the tests.

Alternatively, if utilizing [wrenpm](https://github.com/brandly/wrenpm) for package management in your project, you can add `wren-warble` to your [package.toml](https://github.com/datatypevoid/wren-warble/blob/develop/package.toml) file and install `wren-warble` from within your project root directory with:

```bash
$ wrenpm install
```


## Usage

### TODO


### Dependencies

-	*wren* - The best way to get `wren` up and running on your machine is to build from source. You can find more details [here](http://wren.io/getting-started.html).
- *git* - Get `git` [from here](http://git-scm.com/download).


### Testing

Test scripts utilize the [wren-test](https://github.com/gsmaverick/wren-test) framework and are stored in the `tests/` [directory](https://github.com/datatypevoid/wren-warble/tree/develop/tests). You can launch the tests with:

```bash
$ wren ./tests/module.wren
```

Note that you must have the [wren-test](https://github.com/gsmaverick/wren-test) framework installed for the tests to run. The fastest way to do this is to build [wrenpm](https://github.com/brandly/wrenpm) and do:

```bash
# from within the root directory of this project:
$ wrenpm install
```


### Examples

Examples live in the `examples/` [directory](https://github.com/datatypevoid/wren-warble/tree/develop/examples). You can run an example with:

```bash
# `file` is the filename of the example you'd like to run.
$ wren ./examples/file.wren
```


## Wren

### Use a Wren-aware editor

We have good experience using these editors:

-	[Atom](https://atom.io/) with the [Wren language package](https://github.com/munificent/wren-atom)


## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [releases on this repository](https://github.com/datatypevoid/wren-warble/releases).


## Authors

* **David Newman** - *Initial development and ongoing maintenance* - [datatypevoid](https://github.com/datatypevoid)

See also the list of [contributors](https://github.com/datatypevoid/wren-warble/blob/develop/contributors.toml) who participated in this project.


## License

This project is licensed under the ISC License - see the [LICENSE](https://github.com/datatypevoid/wren-warble/blob/develop/LICENSE) file for details


## Acknowledgments

* Thanks to [Bob](https://github.com/munificent) and [friends](https://github.com/wren-lang/wren/graphs/contributors) for giving us [Wren](https://github.com/wren-lang/wren).
* Hat tip to anyone whose code was used.
