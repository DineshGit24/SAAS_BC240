tableextension 50101 "Sales&ReceivableSetup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Disable Dialog After Posting"; Boolean)
        {
            Caption = 'Disable Dialog After Posting';
            DataClassification = ToBeClassified;
        }
    }
}
pageextension 50101 "Sales&ReceivableSetupPageExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addfirst(General)
        {
            field("Disable Dialog After Posting"; Rec."Disable Dialog After Posting")
            {
                ApplicationArea = all;
            }
        }

    }
}

codeunit 50100 EventHandler
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnPostDocumentBeforeNavigateAfterPosting', '', false, false)]
    local procedure OnPostDocumentBeforeNavigateAfterPosting(var IsHandled: Boolean);
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesSetup.Get() then
            if SalesSetup."Disable Dialog after posting" then
                IsHandled := true;
    end;
}

codeunit 50101 EventHandler_Altenate
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Instruction Mgt.", 'OnAfterIsEnabled', '', false, false)]
    local procedure OnAfterIsEnabled(InstructionType: Code[50]; var Result: Boolean);
    var
        SalesSetup: Record "Sales & Receivables Setup";
    begin
        if SalesSetup.Get() then
            if SalesSetup."Disable Dialog after posting" then
                Result := false;
    end;
}
