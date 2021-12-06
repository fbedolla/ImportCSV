/// <summary>
/// Page 3B Import Setup Card (ID 70200).
/// </summary>
page 70200 "3B Import Setup Card"
{
    
    Caption = '3B Import Setup Card';
    PageType = Card;
    SourceTable = "3B Import Files Setup";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field(JTN; Rec.JTN)
                {
                    ApplicationArea = All;
                }
                field(GenJnlBatch; Rec.GenJnlBatch)
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
            action(ImportPage)
            {
                Caption = 'Import Page';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = page "3B Import CSV";
            }
        }
    }
}
