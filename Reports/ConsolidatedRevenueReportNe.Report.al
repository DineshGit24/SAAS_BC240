report 50101 "Revenue Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'ConsolidatedRevenueReportNe.rdlc';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;


    dataset
    {
        dataitem("Dimension Value"; "Dimension Value")
        {
            DataItemTableView = SORTING("Dimension Code", Code)
                                ORDER(Ascending)
                                WHERE("Dimension Code" = CONST('PRODUCT LINE'));
            column(GroupType_DimensionValue; "Dimension Value"."Group Type")
            {
            }
            dataitem("G/L Entry"; "G/L Entry")
            {
                DataItemLink = "Global Dimension 1 Code" = FIELD(Code);
                DataItemTableView = WHERE("G/L Account No." = FILTER(3510001 | 3510003 | 3510099 | 3520001 | 3550001 | 3550002 | 3550003 | 3550004 | 3590099 | 3510001 | 3510003 | 3510099 | 3520001 | 3550001 | 3550002 | 3550003 | 3550004 | 3590099));
                column(Amount_GLEntry; "G/L Entry".Amount)
                {
                }
                column(ProductLineCodeGD1_GLEntry; "G/L Entry"."Global Dimension 1 Code")
                {
                }
                column(inYear; SYSTEM.DATE2DMY("G/L Entry"."Posting Date", 3))
                {
                }
                column(TxtMonth; COPYSTR(FORMAT("G/L Entry"."Posting Date", 0, '<Month Text>'), 1, 3) + '-' + FORMAT(SYSTEM.DATE2DMY("G/L Entry"."Posting Date", 3)))
                {
                }
                column(IntMonth; SYSTEM.DATE2DMY("G/L Entry"."Posting Date", 2) + 1)
                {
                }
                column(Quarter; Quarter)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Quarter := 'Q' + FORMAT(((((DATE2DMY("G/L Entry"."Posting Date", 2) - 1) DIV 3) + 3) MOD 4) + 1);
                end;

                trigger OnPreDataItem()
                begin
                    "G/L Entry".SETRANGE("G/L Entry"."Posting Date", StartDate, EndDate);
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date"; StartDate)
                {
                }
                field("End Date"; EndDate)
                {
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        StartDate: Date;
        EndDate: Date;
        Quarter: Text;
}

