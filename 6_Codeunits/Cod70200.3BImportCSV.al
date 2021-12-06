/// <summary>
/// Codeunit 3BImportCSV (ID 70200).
/// </summary>
codeunit 70200 "ImportCSV"
{



    /// <summary>
    /// CreateJnl.
    /// </summary>
    procedure CreateJnl()
    var
        ImpData: Record "3B Import Entries";
        GenJnlLine: Record "Gen. Journal Line";
        IDSetup: Record "3B Import Files Setup";
    begin
        IDSetup.Get;
        ImpData.Reset();
        ImpData.SetFilter(Col2Lenght,'<>0');
        if ImpData.FindSet() then
            repeat
                GenJnlLine."Journal Template Name" := IDSetup.JTN;
                GenJnlLine."Journal Batch Name" := IDSetup.GenJnlBatch;
                GenJnlLine."Line No." := ImpData."Line No" * 10000;
                GenJnlLine.Insert(true);
                GenJnlLine."Posting Date" := GetDate(ImpData."Column 5");
                GenJnlLine."Account Type" := GenJnlLine."Account Type"::"G/L Account";
                GenJnlLine."Account No." := ImpData."Column 2";
                GenJnlLine.Description := ImpData."Column 4";
                GenJnlLine.Validate(Amount,GetAmnt(ImpData."Column 7"));
                GenJnlLine.Validate("Shortcut Dimension 1 Code",ImpData."Column 3");
                GenJnlLine.Modify(true);
            until ImpData.Next() = 0;
    end;

    local procedure GetDate(TextDate: text[10]): date
    var
        VarDate: Date;
        Ok: Boolean;
        DayT:Text;
        MonthT:Text;
        YearT: Text;
        DateText:Text;
    begin
        DayT := CopyStr(TextDate,4,2);
        MonthT := CopyStr(TextDate,1,2);
        YearT := CopyStr(TextDate,7,4);
        DateText := DayT+MonthT+YearT;

        if Evaluate(VarDate, DateText) then
            exit(VarDate);
    end;
    local procedure GetAmnt(TextAmount: text[20]) :Decimal
    var
        VarAmount: Decimal;
    begin
        if Evaluate(VarAmount, TextAmount) then
            exit(VarAmount);
    end;
}
