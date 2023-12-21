controladdin "STI QR Code Generator"
{
    RequestedHeight = 0;
    RequestedWidth = 0;
    StartupScript = './src/controladdins/scripts/startup.js';
    Scripts = './src/controladdins/scripts/main.js',
              './src/controladdins/libs/wasm.exec.js'
    Images = './src/controladdins/libs/qr-code-gen-lib.wasm';

    event OnControlReady();
    procedure GenerateQRCode(Args: JsonObject; var Result: Text);
}