default:
    cargo run

run-wasm:
    cargo build --target wasm32-unknown-emscripten
    node target/wasm32-unknown-emscripten/debug/hello-wasm.js

test:
    cargo test

build:
    cargo build --release

build-wasm:
    cargo build --target wasm32-unknown-emscripten --release
    ls -la target/wasm32-unknown-emscripten/release/hello*

preview-wasm:
    node target/wasm32-unknown-emscripten/release/hello-wasm.js
lint:
    cargo clippy && cargo fmt --check && just --fmt --check --unstable

fmt:
    cargo fmt && oxfmt && just --fmt --unstable
