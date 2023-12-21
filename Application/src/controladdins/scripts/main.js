const goWasm = new Go();

function GenerateQRCode(args, result) {
  WebAssembly.instantiateStreaming(
    fetch("main.wasm"),
    goWasm.importObject
  ).then((result) => {
    goWasm.run(result.instance);
    result = getQRCode(args.content, args.size);
  });
}
