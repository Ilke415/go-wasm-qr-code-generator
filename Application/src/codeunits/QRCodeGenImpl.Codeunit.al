codeunit 50101 "STI QR Code Gen. Impl."
{
    Access = Internal;

    var
        _Handler: Interface "STI QR Code Gen. ControlAddIn";
        QRCodeGenControl: Codeunit "STI QR Code Gen. Control";

    internal procedure OnControlReady(Control: ControlAddIn "STI QR Code Generator")
    begin
        QRCodeGenControl.InitiliazeControl(Control);
        InitiliazeHandler(QRCodeGenControl);
    end;

    procedure GenerateQRCode(DataToEncode: Text; Size: Integer) Result: Text
    var
        Args: JsonObject;
    begin
        Args.Add('content', DataToEncode);
        Args.Add('size', Size);

        _Handler.GenerateQRCode(Args, Result);
    end;

    local procedure InitiliazeHandler(Handler: Interface "STI QR Code Gen. ControlAddIn")
    begin
        _Handler := Handler;
    end;
}