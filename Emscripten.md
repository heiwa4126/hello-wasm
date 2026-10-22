# Emscripten と Rust の設定

Rust の標準的な開発環境はインストール済みとする。

## Emscripten (emcc)

参考: [wasm32-unknown-emscripten - The rustc book](https://doc.rust-lang.org/beta/rustc/platform-support/wasm32-unknown-emscripten.html)

```sh
git clone https://github.com/emscripten-core/emsdk.git
cd emsdk

./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh
```

で、

```sh
emcc --version
```

このままだと毎回
`source ./emsdk_env.sh`
が要るので、 `~/.bashrc`に

```sh
# Emscripten SDK
export EMSDK_QUIET=1
source "/home/usrt1/emsdk/emsdk_env.sh"
```

のように追加(パスは調整)

## Rust に wasm32-unknown-emscripten ターゲットを追加

```sh
rustup target add wasm32-unknown-emscripten

# 確認
rustup target list --installed
```
