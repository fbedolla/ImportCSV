/// <summary>
/// Page 3B Import files (ID 70201).
/// </summary>
page 70201 "3B Import files"
{
    
    Caption = '3B Import files';
    PageType = Worksheet;
    SourceTable = "3B Import Entries";
    
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
                    ApplicationArea = All;
                }
                field("Column 1"; Rec."Column 1")
                {
                    ToolTip = 'Specifies the value of the Column 1 field.';
                    ApplicationArea = All;
                }
                field("Column 2"; Rec."Column 2")
                {
                    ToolTip = 'Specifies the value of the Column 2 field.';
                    ApplicationArea = All;
                }
                field("Column 3"; Rec."Column 3")
                {
                    ToolTip = 'Specifies the value of the Column 3 field.';
                    ApplicationArea = All;
                }
                field("Column 4"; Rec."Column 4")
                {
                    ToolTip = 'Specifies the value of the Column 4 field.';
                    ApplicationArea = All;
                }
                field("Column 5"; Rec."Column 5")
                {
                    ToolTip = 'Specifies the value of the Column 5 field.';
                    ApplicationArea = All;
                }
                field("Column 6"; Rec."Column 6")
                {
                    ToolTip = 'Specifies the value of the Column 6 field.';
                    ApplicationArea = All;
                }
                field("Column 7"; Rec."Column 7")
                {
                    ToolTip = 'Specifies the value of the Column 7 field.';
                    ApplicationArea = All;
                }
                field("Column 8"; Rec."Column 8")
                {
                    ToolTip = 'Specifies the value of the Column 8 field.';
                    ApplicationArea = All;
                }
                field("Column 9"; Rec."Column 9")
                {
                    ToolTip = 'Specifies the value of the Column 9 field.';
                    ApplicationArea = All;
                }
                field("Column 10"; Rec."Column 10")
                {
                    ToolTip = 'Specifies the value of the Column 10 field.';
                    ApplicationArea = All;
                }
                field("Column 11"; Rec."Column 11")
                {
                    ToolTip = 'Specifies the value of the Column 11 field.';
                    ApplicationArea = All;
                }
                field("Column 12"; Rec."Column 12")
                {
                    ToolTip = 'Specifies the value of the Column 12 field.';
                    ApplicationArea = All;
                }
                field("Column 13"; Rec."Column 13")
                {
                    ToolTip = 'Specifies the value of the Column 13 field.';
                    ApplicationArea = All;
                }
                field(Col2Lenght; Rec.Col2Lenght)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(createJnl)
            {
                Caption = 'Create Jnl';
                ApplicationArea = all;
                Image = TransferToGeneralJournal;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    procjnl: Codeunit ImportCSV;
                begin
                    If Rec.FindSet() then
                        procjnl.CreateJnl();
                end;
            }
            action(DeleteAll)
            {
                Caption = 'Delete All Data';
                ApplicationArea = All;
                Image = Delete;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    Rec.DeleteRows();
                end;
            }
        }
    }
}
