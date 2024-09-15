//https://yzhums.com/20552/

pageextension 50100 MyExtension extends "Sales Order"
{
    layout
    {


    }
    trigger OnOpenPage()
    begin
        // Error('Test Error');

    end;

    var
        Msg: Label 'Year: %1\Month: %2\Day: %3\Day Of Week: %4\Week No.: %5';
}