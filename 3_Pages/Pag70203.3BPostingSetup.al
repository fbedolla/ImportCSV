/// <summary>
/// Page 3B Posting Setup (ID 70203).
/// </summary>
page 70203 "3B Posting Setup"
{
    
    ApplicationArea = All;
    Caption = '3B Posting Setup';
    PageType = List;
    SourceTable = "3B Bal. Accnt. to Use";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("G/L Account"; Rec."G/L Account")
                {
                    ToolTip = 'Specifies the value of the G/L Account field.';
                    ApplicationArea = All;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ToolTip = 'Specifies the value of the Account Name field.';
                    ApplicationArea = All;
                }
                field("Jnl. Doc. Type to Use"; Rec."Jnl. Doc. Type to Use")
                {
                    ToolTip = 'Specifies the value of the Journal Doc. Type to use field.';
                    ApplicationArea = All;
                }
                field("Balance G/L Account to Use"; Rec."Balance G/L Account to Use")
                {
                    ToolTip = 'Specifies the value of the Balance G/L Account to Use field.';
                    ApplicationArea = All;
                }
                field("Balance Account Name"; Rec."Balance Account Name")
                {
                    ToolTip = 'Specifies the value of the Balance Account Name field.';
                    ApplicationArea = All;
                }
                field("Cost Center Dim. Code"; Rec."Cost Center Dim. Code")
                {
                    ToolTip = 'Specifies the value of the Global Dimension Code 1 field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
