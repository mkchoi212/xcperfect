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

- Pipe

```bash
$ xcrun xccov --json [options] | xcperfect [options]
```

- Feed it in via flags

```bash
$ xcperfect [--file | -f] report.json [options]
```

> ⚠️ Please note that `xcperfect` only takes in `xccov`'s `--json` output

## Formats

- `--all`, `-a` **Default**

![All](./assets/all.png)

- `--simple`, `-s`

![Simple](./assets/simple.png)

- `--html` **(COMING SOON)**

## ⚙️ Options

- `--[no]-color`: turn on or off coloring **(default is on)**
- `--[no]-utf8`: turn on or off usage of UTF-8 for output **(default is on)**
- `-t, --targets=x,y,z`: choose targets to generate reports for

## ✋ Contributing

This is an open source project so feel free to contribute by

- Opening an [issue](https://github.com/mkchoi212/xcperfect/issues/new)
- Sending me feedback via [email](mailto://mkchoi212@icloud.com)
- Or [tweet](https://twitter.com/Bananamlkshake2) at your boi!

## Note

The name `xcperfect` is not trying to convey that the code is perfect by any means.
The code is far from perfect as this is my first Ruby project; PRs are welcome and appreciated 😀

> ❗ Fun fact! xcperfect has only one dependency - `rouge` - for syntax highlighting. So if you are already using [xcpretty](https://github.com/supermarin/xcpretty), no additional dependencies are required

## LICENSE

[LICENSE.md](./LICENSE.md)
