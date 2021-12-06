/// <summary>
/// Page UploadFiles (ID 70204).
/// </summary>
page 70204 UploadFiles
{
    
    ApplicationArea = All;
    Caption = 'UploadFiles';
    PageType = List;
    SourceTable = UploadedFiles;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field(HasContent; Rec.HasContent)
                {
                    ToolTip = 'Specifies the value of the HasContent field.';
                    ApplicationArea = All;
                }
                field(Filename; Rec.Filename)
                {
                    ToolTip = 'Specifies the value of the Filename field.';
                    ApplicationArea = All;
                }
                field(FileSize; Rec.FileSize)
                {
                    ToolTip = 'Specifies the value of the Filename field.';
                    ApplicationArea = All;
                }
                field(UploadDateTime; Rec.UploadDateTime)
                {
                    ToolTip = 'Specifies the value of the Filename field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(uploadfile)
            {
                Caption = 'Upload files';
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.ImportFile();
                end;
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        if Rec.File.HasValue then 
            Rec.HasContent := true;
    end;
}
