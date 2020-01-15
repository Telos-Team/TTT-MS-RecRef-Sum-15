page 80313 "RecRef Sum TTT-MSRRS"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "RecRef Sum TTT-MSRRS";
    SourceTableTemporary = true;
    Editable = false;
    Caption = 'RecRef Sum';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Field No."; "Field No.")
                {
                    ApplicationArea = All;

                }
                field("Field Caption"; "Field Caption")
                {
                    ApplicationArea = All;
                }
                field("Sum"; "Sum")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }
}