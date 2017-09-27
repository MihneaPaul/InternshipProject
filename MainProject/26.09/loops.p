
/*------------------------------------------------------------------------
    File        : loops.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 01:56:58 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable iCount as integer no-undo init 1.
define variable iTotal as integer no-undo init 1.

do iCount = 0 to 4:
    iTotal = iTotal + iCount.
end.
display iTotal.

do while iTotal < 50:
    iTotal = iTotal * 2.
end.
display iTotal.
ETIME(Yes).
/*for each Customer no-lock where Customer.State = "NH",                   */
/* each Order of Customer no-lock where Order.ShipDate NE ? :              */
/*    display Customer.Custnum Customer.Name Order.OrderNum Order.ShipDate.*/
/*    end.                                                                 */
/*    ETIME(No).                                                           */
/*    display ETIME.                                                       */
    
/*for each Order no-lock where Order.ShipDate NE ?, Customer of Order no-lock:*/
/*    display Customer.Name Order.Ordernum Order.Shipdate.                    */
/*end.                                                                        */
        
for each Customer no-lock where Customer.State = "NH", first Order of Customer USE-INDEX OrderDate:
    display Customer.CustNum Customer.Name Order.OrderNum Order.OrderDate.
end.

CustBlock:
for each Customer no-lock where Customer.State = "NH" with frame f:
    display Customer.CustNum Customer.Name.

    OrderBlock:
    for each Order of Customer no-lock by Order.OrderDate:
        display Order.OrderNum Order.OrderDate with frame f.
        leave OrderBlock.
    end.
end.

find first Customer where Customer.Country = "USA".
display Customer.CustNum Customer.Name Customer.Country.
 