codeunit 50100 "STI QR Code Gen. Control" implements "STI QR Code Gen. ControlAddIn"
{
    var
        _Control: ControlAddIn "STI QR Code Generator";

    procedure InitiliazeControl(Control: ControlAddIn "STI QR Code Generator")
    begin
        _Control := Control;
    end;

    procedure GenerateQRCode(Args: JsonObject; var Result: Text);
    begin
        _Control.GenerateQRCode(Args, Result);
    end;
}