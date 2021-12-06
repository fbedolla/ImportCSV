/// <summary>
/// Table 3B Import Entries (ID 70201).
/// </summary>
table 70201 "3B Import Entries"
{
    Caption = '3B Import Entries';
    DataClassification = CustomerContent;
    
    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            DataClassification = CustomerContent;
        }
        field(2; "Column 1"; Text[10])
        {
            Caption = 'Column 1';
            DataClassification = CustomerContent;
        }
        field(3; "Column 2"; Text[10])
        {
            Caption = 'Column 2';
            DataClassification = CustomerContent;
            //Posting Account
        }
        field(4; "Column 3"; Text[10])
        {
            Caption = 'Column 3';
            DataClassification = CustomerContent;
            //Store or Cost Center
        }
        field(5; "Column 4"; Text[50])
        {
            Caption = 'Column 4';
            DataClassification = CustomerContent;
            //Store Name
        }
        field(6; "Column 5"; Text[10])
        {
            Caption = 'Column 5';
            DataClassification = CustomerContent;
            //Operation Date
        }
        field(7; "Column 6"; Text[10])
        {
            Caption = 'Column 6';
            DataClassification = CustomerContent;
            //Empty
        }
        field(8; "Column 7"; Text[20])
        {
            Caption = 'Column 7';
            DataClassification = CustomerContent;
            //decimal amount 1
        }
        field(9; "Column 8"; Text[20])
        {
            Caption = 'Column 8';
            DataClassification = CustomerContent;
            //Decimal Amount 2
        }
        field(10; "Column 9"; Text[50])
        {
            Caption = 'Column 9';
            DataClassification = CustomerContent;
            //Operation description
        }
        field(11; "Column 10"; Text[10])
        {
            Caption = 'Column 10';
            DataClassification = CustomerContent;
            //Empty
        }
        field(12; "Column 11"; Text[10])
        {
            Caption = 'Column 11';
            DataClassification = CustomerContent;
            //Empty
        }
        field(13; "Column 12"; Text[10])
        {
            Caption = 'Column 12';
            DataClassification = CustomerContent;
            //Empty
        }
        field(14; "Column 13"; Text[10])
        {
            Caption = 'Column 13';
            DataClassification = CustomerContent;
            //Empty
        }
        field(15; "Column 14"; Text[10])
        {
            Caption = 'Column 14';
            DataClassification = CustomerContent;
            //Empty
        }
        field(100; "Col2Lenght"; Integer)
        {
            Caption = 'Col2Lenght';
            DataClassification = CustomerContent;
            //Empty
        }
    }
    keys
    {
        key(PK; "Line No")
        {
            Clustered = true;
        }
    }
    
    /// <summary>
    /// DeleteRows.
    /// </summary>
    procedure DeleteRows()
    begin
        if Rec.FindSet() then
            Rec.DeleteAll(true);
    end;
}
