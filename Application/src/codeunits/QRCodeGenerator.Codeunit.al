codeunit 50102 "STI QR Code Generator"
{
    var
        QRCodeGenImpl: Codeunit "STI QR Code Gen. Impl.";

    procedure OnControlReady(Control: ControlAddIn "STI QR Code Generator")
    begin
        QRCodeGenImpl.OnControlReady(Control);
    end;

    procedure GenerateQRCode(DataToEncode: Text; Size: Integer) Result: Text
    begin
        exit(QRCodeGenImpl.GenerateQRCode(DataToEncode, Size));
    end;
}