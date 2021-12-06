/// <summary>
/// Table 3B Bal. Accnt. to Use (ID 70202).
/// </summary>
table 70202 "3B Bal. Accnt. to Use"
{
    Caption = '3B Bal. Accnt. to Use';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "G/L Account"; Code[20])
        {
            Caption = 'G/L Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
            trigger OnValidate()
            begin
                "Account Name" := GetAccName("G/L Account");
            end;
        }
        field(2; "Account Name"; Text[50])
        {
            Caption = 'Account Name';
            DataClassification = CustomerContent;
        }
        field(3; "Balance G/L Account to Use"; Code[20])
        {
            Caption = 'Balance G/L Account to Use';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
            trigger OnValidate()
            begin
                "Balance Account Name" := GetAccName("G/L Account");
            end;
        }
        field(4; "Balance Account Name"; Text[50])
        {
            Caption = 'Balance Account Name';
            DataClassification = CustomerContent;
        }
        field(5; "Cost Center Dim. Code"; Code[20])
        {
            Caption = 'Global Dimension Code 1';
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
        Field(10; "Jnl. Doc. Type to Use"; Enum "Gen. Journal Document Type")
        {
            Caption = 'General Journal Document Type to Use';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "G/L Account","Cost Center Dim. Code")
        {
            Clustered = true;
        }
    }
    local procedure GetAccName(GLAccNo: Code[20]):Text
    var
        GLAcc: Record "G/L Account";
    begin
        GLAcc.Get(GLAccNo);
            exit(GLAcc.Name);
    end;
}
