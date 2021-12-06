/// <summary>
/// Page 3B Import CSV (ID 70202).
/// </summary>
page 70202 "3B Import CSV"
{
    
    ApplicationArea = All;
    Caption = '3B Import CSV';
    PageType = List;
    SourceTable = "CSV Buffer";
    SourceTableTemporary = true;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                }
                field("Field No."; Rec."Field No.")
                {
                    ToolTip = 'Specifies the value of the Field No. field.';
                    ApplicationArea = All;
                }
                field("Value"; Rec."Value")
                {
                    ToolTip = 'Specifies the value of the Value field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Import)
            {
                Caption = 'Import csv';
                Image = ImportExcel;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                trigger OnAction()
                var
                    InS: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('CSV Filename','','',FileName,InS) then begin 
                        Rec.LoadDataFromStream(InS,',');
                        Message('Lines = %1',Rec.GetNumberOfLines());
                    end
                end;
            }
            action(Create3BEntry)
            {
                Caption = 'Create 3B Entries';
                Image = SelectEntries;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    LineNo: Integer;
                begin
                    for LineNo := 1 to Rec.GetNumberOfLines() do begin 
                        CreateEntries(LineNo);
                    end;

                    Page.Run(70201);
                end;
            }
            action(ImportedEntries)
            {
                Caption = 'Imported 3B Entries';
                Image = LedgerEntries;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "3B Import files";
            }
        }

    }

    /// <summary>
    /// GetText1.
    /// </summary>
    /// <param name="LineNo">Integer.</param>
    /// <param name="FieldNo">Integer.</param>
    /// <returns>Return value of type Text.</returns>
    procedure GetText(LineNo: Integer; FieldNo: Integer) : Text
    var
        myInt: Integer;
    begin
        if Rec.Get(LineNo,FieldNo) then
            exit(Rec.Value.TrimEnd('"').TrimStart('"'))
    end;

    local procedure GetDate(LineNo: Integer; FieldNo: Integer): Date
    var
        D: Date;
    begin
        if Rec.Get(LineNo,FieldNo) then
            Evaluate(D,Rec.Value.TrimEnd('"').TrimStart('"'));
            exit(D)
    end;

    local procedure CreateEntries(var LineNo: Integer)
    var
        IE: Record "3B Import Entries";
    begin
        IE.Init();
        IE."Line No" := LineNo;
        IE."Column 1" := GetText(LineNo,1);
        IE."Column 2" := GetText(LineNo,2);
        IE."Column 3" := GetText(LineNo,3);
        IE."Column 4" := GetText(LineNo,4);
        IE."Column 5" := GetText(LineNo,5);
        IE."Column 6" := GetText(LineNo,6);
        IE."Column 7" := GetText(LineNo,7);
        IE."Column 8" := GetText(LineNo,8);
        IE."Column 9" := GetText(LineNo,9);
        IE."Column 10" := GetText(LineNo,10);
        IE."Column 11" := GetText(LineNo,11);
        IE."Column 12" := GetText(LineNo,12);
        IE."Column 13" := GetText(LineNo,13);
        IE."Column 14" := GetText(LineNo,14);
        IE.Col2Lenght := GetLen(GetText(LineNo,2));
        IE.Insert(true);
    end;
    local procedure GetLen(AccTxt: Text[20]):Integer
    var
        VarLen: Integer;
    begin
        VarLen := StrLen(AccTxt);
        exit(VarLen);

    end;

    trigger OnAfterGetRecord()

    begin
        Rec.Value:= Rec.Value.TrimEnd('"').TrimStart('"');
    end;
}
