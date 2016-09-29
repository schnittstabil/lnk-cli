# lnk-cli [![Build Status](https://travis-ci.org/schnittstabil/lnk-cli.svg?branch=master)](https://travis-ci.org/schnittstabil/lnk-cli) [![Build status](https://ci.appveyor.com/api/projects/status/vec2cfofcl3k4sj1?svg=true)](https://ci.appveyor.com/project/schnittstabil/lnk-cli) [![Coverage Status](https://coveralls.io/repos/schnittstabil/lnk-cli/badge.svg?branch=master)](https://coveralls.io/r/schnittstabil/lnk-cli?branch=master) [![XO code style](https://img.shields.io/badge/code_style-XO-5ed9c7.svg)](https://github.com/sindresorhus/xo)

> Create links between files cross-platform

## Why

* Create _hard links_, _directory junctions_ and _symbolic links_ depending on the platform

## Install

```sh
$ [sudo] npm install lnk-cli --global
```

## Usage

```
$ tree
.
└── assets
    ├── favicon.ico
    └── style
        ├── app.css
        └── vendor.css

2 directories, 3 files
```

```sh
$ lnk assets/favicon.ico assets/style dist

# or using bash globs
$ lnk assets/* dist
```

```
$ tree
.
├── assets
│   ├── favicon.ico
│   └── style
│       ├── app.css
│       └── vendor.css
└── dist
    ├── favicon.ico              // hard link to assets/favicon.ico
    └── style -> ../assets/style // symlink; directory junction on windows

4 directories, 4 files
```

## Glob support

`lnk` don't support globbing by itself, for platform independent glob support use [globstar](https://github.com/schnittstabil/globstar):

```sh
$ npm install globstar --global

$ globstar -- lnk "assets/*" dist
```

Please note that Windows needs double quotes, especially if you want to use it in your `package.json`:

```json
  "scripts": {
    "link-assets": "globstar --node -- lnk \"assets/*\" dist",
  },
```


## Related

* [lnk](https://github.com/schnittstabil/lnk) – API version of this project
* [globstar](https://github.com/schnittstabil/globstar) – if you need glob/globstar support, especially on Windows
* [cpy-cli](https://github.com/sindresorhus/cpy-cli) – if you need to copy multiple files
* [del-cli](https://github.com/sindresorhus/del-cli) – if you need to delete files and folders

## License

MIT © [Michael Mayer](http://schnittstabil.de)
