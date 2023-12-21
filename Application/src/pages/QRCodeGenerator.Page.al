page 50100 "STI QR Code Generator"
{
    ApplicationArea = All;
    Caption = 'QR Code Generator';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Data to Encode"; DataToEncode)
                {
                    ApplicationArea = All;
                    Caption = 'Content';
                    ToolTip = 'Specifies the value of the Content field.';
                }
                field(Size; Size)
                {
                    ApplicationArea = All;
                    Caption = 'Size';
                    ToolTip = 'Specifies the value of the Size field.';
                }
                usercontrol(QRCodeGenerator; "STI QR Code Generator")
                {
                    ApplicationArea = All;

                    trigger OnControlReady()
                    begin
                        QRCodeGenerator.OnControlReady(CurrPage.QRCodeGenerator);
                    end;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Data Creation")
            {
                ApplicationArea = All;
                Image = BarCode;
                Caption = 'Generate QR Code';
                ToolTip = 'Executes the Generate QR Code action.';
                trigger OnAction()
                var
                    Result: Text;
                begin
                    if DataToEncode = '' then
                        exit;

                    if Size <= 0 then
                        exit;

                    Result := QRCodeGenerator.GenerateQRCode(DataToEncode, Size);

                    Message(Result);
                end;
            }
        }
    }

    var
        QRCodeGenerator: Codeunit "STI QR Code Generator";
        DataToEncode: Text;
        Size: Integer;
}