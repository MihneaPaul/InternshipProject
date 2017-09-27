
/*------------------------------------------------------------------------
    File        : buffers1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 07:09:45 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */

/* ***********************  Main Block  *************************** */
define buffer Customer  for Customer.
define buffer OtherCust for Customer.

for each Customer no-lock where Customer.Country = "USA":
    find first OtherCust no-lock
        where Customer.State = OtherCust.State
        and Customer.City = OtherCust.City
        and substring(Customer.PostalCode, 1,3) NE
        substring(OtherCust.PostalCode, 1,3)
        and Customer.CustNum < OtherCust.CustNum no-error.
    if available OtherCust then
        display
            Customer.CustNum
            Customer.City format "x(12)"
            Customer.State format "xx"
            Customer.PostalCode
            OtherCust.CustNum
            OtherCust.PostalCode.
end.

for each Customer no-lock by Customer.CreditLimit descending:
    display "Highest:" Customer.CustNum CUstomer.Name Customer.CreditLimit
        with 1 down.
    leave.
end.
    
for each Customer no-lock where CUstomer.State = "NH"
    by Customer.CreditLimit descending:
    display Customer.CustNum Customer.Name Customer.CreditLimit.
end.
