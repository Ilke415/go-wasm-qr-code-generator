async function GenerateQRCode(args, output) {
  await GenerateQRCodeImpl(args, output);
}

async function GenerateQRCodeImpl(args, output) {
  debugger;
  const go = new Go();
  await WebAssembly.instantiateStreaming(
    fetch(
      Microsoft.Dynamics.NAV.GetImageResource(
        "src/controladdins/libs/qr-code-gen-lib.wasm"
      )
    ),
    go.importObject
  ).then((result) => {
    go.run(result.instance);
    output = getQRCode(args.content, args.size);
    const controladdinContainer = document.querySelector("#controlAddIn");

    const imageContainer = controladdinContainer.querySelector("img");

    if (imageContainer == null) {
      const htmlToInsert = `<img src="data:image/gif;base64,${output}" width="${args.size}" height="${args.size}"></img>`;
      controladdinContainer.innerHTML += htmlToInsert;
    } else {
      imageContainer.src = `data:image/gif;base64,${output}`;
    }
  });
}
