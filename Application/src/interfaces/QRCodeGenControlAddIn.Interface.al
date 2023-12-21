interface "STI QR Code Gen. ControlAddIn"
{
    Access = Internal;

    procedure GenerateQRCode(Args: JsonObject; var Result: Text);
}