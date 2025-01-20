.PHONY: build check regenerate component restart-unit clean

WASM?="./target/wasm/release/build/gen/gen.wasm"
IGNORE?=--ignore-stub

build:
	@echo "Building the project"
	moon build --target wasm 

check:
	@echo "Checking the project"
	moon check --target wasm

regenerate:
	@echo "Regenerating the bindings"
	@wit-deps update 
	wit-bindgen moonbit wit ${IGNORE} --derive-show --derive-eq --out-dir . 
	moon fmt

component: build
	@echo "Generating wasm-tools component for ${WASM}"
	wasm-tools component embed wit ${WASM} -o ${WASM} --encoding utf16
	wasm-tools component new ${WASM} -o ${WASM}

restart-unit: component
	@echo "Restarting the unit"
	cat unit.conf.json | http PUT :9090/config
	http :9090/control/applications/demo/restart
	http :8091/ 

clean:
	@echo "Cleaning up"
	moon clean