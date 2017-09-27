
/*------------------------------------------------------------------------
    File        : findsAndIndexes.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 05:32:16 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable countAll as integer no-undo init 0.

find first Customer no-lock where Customer.Country = "USA".
display Customer.CustNum Customer.Name CUstomer.Country.

repeat:
    find next Customer no-lock where Customer.Country = "USA" use-index name no-error.
    if available Customer then
        display Customer.CustNum Customer.Name format "x(20)" Customer.Country
            Customer.PostalCode.
    else leave.
end.

