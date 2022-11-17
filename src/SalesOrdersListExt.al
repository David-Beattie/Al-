pageextension 50105 SalesOrderListExt extends "Sales Order List"
{
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
                    Text000: Label 'Are you sure you would like to delete the selected records?';
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
}