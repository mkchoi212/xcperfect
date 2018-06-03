<p align="center">
  <img src="./assets/banner.png">
  <br>
  <p align="center">
    <a href="https://travis-ci.org/mkchoi212/xcperfect">
      <img src="https://travis-ci.org/mkchoi212/xcperfect.svg?branch=master">
    </a>
    <a href="https://badge.fury.io/rb/xcperfect">
      <img src="https://badge.fury.io/rb/xcperfect.svg">
    </a>
  </p>
</p>
<br>

## Installation

```bash
$ gem install xcperfect
```

## Usage

```bash
$ xcrun xccov --json [options] | xcperfect
```

or 

```bash
$ xcrun xccov --json [options] > report.json
$ xcperfect report.json
```

or

```bash
$ xcperfect [--file | -f] report.json [options]
```

## Formats

- `--all`, `-a` **Default**

- `--simple`, `-s`

![Simple Formatter](./assets/simple_formatter.png)

## ✋ Contributing

This is an open source project so feel free to contribute by

- Opening an [issue](https://github.com/mkchoi212/xcperfect/issues/new)
- Sending me feedback via [email](mailto://mkchoi212@icloud.com)
- Or [tweet](https://twitter.com/Bananamlkshake2) at your boi!

## LICENSE

Please look at [LICENSE.md](./LICENSE.md)

