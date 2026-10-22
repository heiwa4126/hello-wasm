# hello-wasm

1. Rust で "Hello world" を書いて、
2. wasm としてコンパイルし(wasm32-unknown-emscripten)、
3. node で実行する。

## 準備

[Emscripten と Rust の設定](Emscripten.md) 参照。

他に
タスクランナーの [just](https://github.com/casey/just) と
wasm 実行用に nodejs が必要

## 実行

```sh
# ホストのターゲットで実行
just

# wasm で実行
just run-wasm

# リリースモードでビルドして実行
just build-wasm
just preview-wasm
```

### 実行例

```console
$ just run-wasm

cargo build --target wasm32-unknown-emscripten
warning: linker stderr: emcc: WASM_BIGINT is deprecated (no longer needed. Should only ever be implicitly disabled by -sWASM=0). Please open a bug if you have a continuing need for this setting [-Wdeprecated]
  |
  = note: `#[warn(linker_messages)]` on by default

warning: `hello-wasm` (bin "hello-wasm") generated 1 warning
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.00s
node target/wasm32-unknown-emscripten/debug/hello-wasm.js

Hello, WebAssembly!
```

WASM_BIGINT に関する警告は
Rust のビルドが古い設定をリンカーに渡しているらしい。

## 参考 - 実行したバージョン

```console
$ emcc --version

emcc (Emscripten gcc/clang-like replacement + linker emulating GNU ld) 6.0.13 (e13ee988ce3d87a738dd8f3661d02223308c412a)
Copyright (C) 2026 the Emscripten authors (see AUTHORS.txt)
This is free and open source software under the MIT license.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ rustc --version

rustc 1.99.1 (58cf8f9c3 2026-10-13)
```
