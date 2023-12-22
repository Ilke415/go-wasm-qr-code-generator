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
                    MaxValue = 400;
                    MinValue = 1;
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
        area(Creation)
        {
            action("Data Creation")
            {
                ApplicationArea = All;
                Caption = 'Generate QR Code';
                Image = BarCode;
                ToolTip = 'Executes the Generate QR Code action.';
                PromotedCategory = Process;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if DataToEncode = '' then
                        exit;

                    if Size <= 0 then
                        exit;

                    QRCodeGenerator.GenerateQRCode(DataToEncode, Size);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        DataToEncode := 'https://';
        Size := 250;
    end;

    var
        QRCodeGenerator: Codeunit "STI QR Code Generator";
        Size: Integer;
        DataToEncode: Text;
}