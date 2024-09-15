tableextension 50100 "Dimension ValueExt" extends "Dimension Value"
{
    fields
    {
        field(50100; "Group Type"; Option)
        {
            Caption = '';
            DataClassification = ToBeClassified;
            OptionMembers = SCAF,Trading,ECB;
        }
    }
}
