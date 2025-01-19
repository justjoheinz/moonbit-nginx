.PHONY: build check regenerate clean

WASM?="./target/wasm/release/build/gen/gen.wasm"
IGNORE?=--ignore-stub

build:
	moon build --target wasm

check:
	moon check --target wasm

regenerate:
	@wit-deps update 
	wit-bindgen moonbit wit ${IGNORE} --derive-show --derive-eq --out-dir . 
	moon fmt

component: 
	@echo "Generating wasm-tools component for ${WASM}"
	wasm-tools component embed wit ${WASM} -o ${WASM} --encoding utf16
	wasm-tools component new ${WASM} -o ${WASM}

clean:
	moon clean