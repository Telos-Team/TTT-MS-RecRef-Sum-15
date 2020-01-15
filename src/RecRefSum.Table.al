table 80313 "RecRef Sum TTT-MSRRS"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Field No."; Integer)
        {
            Caption = 'Field No.';
            DataClassification = SystemMetadata;
        }
        field(2; "Field Caption"; Text[50])
        {
            Caption = 'Field Caption';
            DataClassification = SystemMetadata;
        }

        field(3; "Sum"; Decimal)
        {
            Caption = 'Sum';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Field No.")
        {
            Clustered = true;
        }
    }

}