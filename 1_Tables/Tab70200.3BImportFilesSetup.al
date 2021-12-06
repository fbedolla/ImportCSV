/// <summary>
/// Table 3B Import Files Setup (ID 70200).
/// </summary>
table 70200 "3B Import Files Setup"
{
    Caption = '3B Import Files Setup';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Primary Key"; Code[1])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(10;  "JTN"; Code[10])
        {
            Caption = 'Journal Template Name';
            NotBlank = true;
            TableRelation = "Gen. Journal Template";
        }
        field(11; GenJnlBatch; Code[10])
        {
            Caption = 'Gen. Jnl. To Use';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Journal Batch".Name where ("Journal Template Name" = field(JTN));
        }
    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
