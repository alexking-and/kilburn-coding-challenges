emcc src/spellcheck.c -o wasm-web-build/index.html -O3 -s WASM=1 -s NO_EXIT_RUNTIME=1  -s "EXTRA_EXPORTED_RUNTIME_METHODS=['ccall']"
