pageextension 80313 "General Ledger Entry TTT-MSRRS" extends "General Ledger Entries"
{
    actions
    {
        addlast("F&unctions")
        {
            action("Sum TTT-MSRRS")
            {
                Caption = 'Sum';
                ToolTip = 'Shows sum of all relevant fields within active filters';
                Image = NewSum;
                ApplicationArea = All;
                trigger OnAction()
                var
                    recRefSumMgt: codeunit "RecRef Management TTT-MSRRS";
                    recRef: RecordRef;
                begin
                    recRef.GetTable(rec);
                    recRefSumMgt.SumFields(recRef);
                end;
            }
        }
    }
}
