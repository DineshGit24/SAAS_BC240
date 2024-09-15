codeunit 50102 Ternary_Operator
{
    trigger OnRun()

    var
        MyExp: Boolean;
        MyVar: Text;

    begin
        if MyExp then
            MyVar := 'TRUE'
        else
            MyVar := 'FALSE';


        //MyVar := MyExp ? 'TRUE' : 'FLASE';
    end;

    var
}