/// <summary>
/// Table UploadedFiles (ID 70203).
/// </summary>
table 70203 UploadedFiles
{
    Caption = 'UploadedFiles';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(2; HasContent; Boolean)
        {
            Caption = 'HasContent';
            DataClassification = CustomerContent;
        }
        field(3; "File"; Blob)
        {
            Caption = 'File';
            DataClassification = CustomerContent;
        }
        field(4; Filename; Text[100])
        {
            Caption = 'Filename';
            DataClassification = CustomerContent;
        }
        Field(10; "FileSize"; Integer)
        {
            Caption = 'File Size';
            DataClassification = CustomerContent;
        }
        field(11; "UploadDateTime"; DateTime)
        {
            Caption = 'Upload DateTime';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }
    
    /// <summary>
    /// ImportFile.
    /// </summary>
    procedure ImportFile()
    var
        TempBlob: Codeunit "Temp Blob";
        InStr: InStream;
        OutStr: OutStream;
        FileMgt: Codeunit "File Management";
    begin
        
        Filename := FileMgt.BLOBImportWithFilter(TempBlob, 'Select a file','','CSV Files (*.csv)|*.csv','csv');
        if Filename= '' then
            exit;
        TempBlob.CreateInStream(InStr);
        File.CreateOutStream(OutStr);
        CopyStream(OutStr, InStr);
        if Name =  '' then
            Name := Filename;
        if not Modify() then
            Insert();

        FileSize := TempBlob.Length();
        UploadDateTime := CurrentDateTime;
    end;
}
