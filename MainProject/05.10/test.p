
/*------------------------------------------------------------------------
    File        : exercitiul1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Oct 05 10:05:11 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

    // Update/delete data on Customer, Order & Order lines using data-sets
    
define temp-table ttCustomer like Customer before-table btCustomer.
    
define temp-table ttOrder like Order before-table btOrder.
    
define temp-table ttOrderLine like Orderline before-table btOrderLine.
    
define dataset dstCustOrder for ttCustomer, ttOrder, ttOrderLine
    data-relation drCustOrder for ttCustomer, ttOrder
    relation-fields(CustNum,CustNum)
    data-relation drOrderOrderLine for ttOrder, ttOrderLine
    relation-fields(OrderNum,OrderNum).
    
define query qCustomer for Customer.
define query qOrder for Order.
define data-source srcCustomer for query qCustomer
Customer keys(CustNum).
define data-source srcOrder for query qOrder
Order keys(OrderNum).
define data-source srcOrderLine for OrderLine.

buffer ttCustomer:attach-data-source(data-source srcCustomer:handle,?,?).
buffer ttOrder:attach-data-source(data-source srcOrder:handle,?,?). 
buffer ttOrderLine:attach-data-source(data-source srcOrderLine:handle,?,?).
query qCustomer:query-prepare("for each Customer where CustNum < 10").
query qOrder:query-prepare("for each Order where OrderNum < 10").
/*query qOrder:query-prepare("for each Order").*/

dataset dstCustOrder:fill().

dataset dstCustOrder:write-xml("file","c:\tmp\dstCustOrder.xml",true).
for each ttCustomer no-lock:
    display ttCustomer.Name
        ttCustomer.CustNum
        with frame ttCustFrame 1 col title "Customer".
end.
for each ttOrder no-lock:
    display ttOrder.OrderNum
        ttOrder.ShipDate
        with frame ttOrderFrame 1 col title "Order".
end.

for each ttOrderLine no-lock:
    display ttOrderLine.Qty. 
    end.