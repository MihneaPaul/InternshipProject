
/*------------------------------------------------------------------------
    File        : otherFindExamples.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 06:32:16 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */   

/* ***************************  Main Block  *************************** */

for each Customer no-lock where Customer.Country = "USA", each Order of Customer no-lock:
    if can-find(first Order of Customer where Order.OrderDate < 1/1/1997) then
        display Customer.CustNum Customer.Name Order.OrderDate.
    else
        display Customer.CustNum   "No 1997 Orders" @ Customer.Name.
end