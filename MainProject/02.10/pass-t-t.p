
/*------------------------------------------------------------------------
    File        : pass-t-t.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 11:56:36 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table pass-table
    field pass_contact  as character format "x(20)"
    field pass_country  as character format "x(20)"
    field pass_balance  as decimal
    field pass_discount as integer.

do:
    for each Customer where Customer.CustNum < 40:
        create pass-table.
        assign
            pass_contact = Customer.Contact
            pass_country = Customer.Country
            pass_balance = Customer.Balance
            pass_discount = Customer.Discount.
        
    end.
        
    run catch-t-t.p(input table pass-table).
end.