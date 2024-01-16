# extism-init :sparkles:

This is a command line tool that acts as a companion to the
[Extism](https://extism.org/) :skull:
[zig-pdk](https://github.com/extism/zig-pdk/) module
for [Zig](https://ziglang.org/) :zap:

`extism-init` is used to create a directory containing code
that allows you to promptly get started coding on a plugin
for [Extism](https://extism.org/) using Zig.

The Zig build `.target` is declared as `.{ .abi = .musl, .os_tag = .freestanding, .cpu_arch = .wasm32 }`
and `.optimize` is set to `.ReleaseSmall`

> [!Important]
> No need to specify `-Doptimize=ReleaseSmall`

## Installation

(Requires you to have [Go](https://go.dev/) installed)

```sh
go install github.com/peterhellberg/extism-init@latest
```

## Usage

(Requires you to have an up to date (_nightly_) version of
[Zig](https://ziglang.org/download/#release-master) installed,
as well as the [Extism CLI](https://extism.org/docs/install).

```sh
extism-init myplugin
cd myplugin
zig build
extism call ./zig-out/bin/myplugin.wasm greet --input "Jane Doe"
```

:seedling:
