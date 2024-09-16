<h1 align="center">kir68k/url-info</h1>
<p align="center">
    <a href="https://spdx.org/licenses/ISC.html">
        <img src="https://img.shields.io/badge/License-ISC-FF4783.svg">
    </a>
</p>

## What this
url-info is a simple C++ project/learning exercise which outputs information about a specified URL, using [ada](https://ada-url.com/).

## How to build
This project uses Nix + meson for compilation

### Dependencies
#### Using Nix
- Nix
    - Requires enabled flake support

#### Native meson
- ada
- boost
- meson
- pkg-config
- cmake
    - CMake is required for finding `ada`, pkg-config does not work.

### Building
#### Using nix
Simply run the following commands from this directory:
```console
$ nix build
```
You can then use `./result/bin/url-info`.

#### Using native meson
Run the following commands from this directory:
```bash
meson setup build && cd build
ninja
```
You can then use `./url-info` from the build directory.
