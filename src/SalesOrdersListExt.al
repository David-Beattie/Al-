pageextension 50105 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("P&osting")

        {

            action(DeleteSelected)
            {

                Caption = 'Delete Selected';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                    // Answer: Boolean;
                    // Question: Text;
                    Text000: Label 'Are you sure you would like to delete the selected records?';
                    Text001: Label 'Not deleted';

                begin
                    CurrPage.SetSelectionFilter(SalesHeader);


                    if Confirm(Text000) then begin
                        SalesHeader.FindSet();
                        repeat
                            SalesHeader.Delete(true);
                        until SalesHeader.Next() = 0
                    end
                end;
            }

        }

    }

    var
        myInt: Integer;
}