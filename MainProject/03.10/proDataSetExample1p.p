
/*------------------------------------------------------------------------
    File        : proDataSetExample1p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 03 11:01:12 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// define temp tables

define temp-table ttOrder before-table ttOrderBefore
    field OrderNum  like Order.OrderNum
    field OrderDate like Order.OrderDate
    field CustName  like Customer.Name
    field Discount  like Customer.Discount
    field RepName   like SalesRep.RepName
    index OrderNum is unique OrderNum.

define temp-table ttOLine like Orderline before-table ttOLineBefore.

define temp-table ttItem
    field ItemNum  like Item.ItemNum
    field ItemName like Item.ItemName
    field Price    like Item.Price
    index ItemNum is unique ItemNum.

// define ProDataSet

define dataset dsOrder for ttOrder, ttOLine, ttItem
    data-relation drOrderLine for ttOrder, ttOLine relation-fields(OrderNum,OrderNum)
    data-relation drLineItem for ttOLine, ttItem relation-fields(ItemNum,ItemNum).

// identify, define, attach datasources

define query qOrder for Order.
define data-source srcOrder for query qOrder
Order keys(OrderNum).
define data-source srcOLine for OrderLine.
define data-source srcItem for Item.

// attach datasources and do the fill()

buffer ttOrder:attach-data-source(data-source srcOrder:handle,?,?).
buffer ttOLine:attach-data-source(data-source srcOLine:handle,?,?).
buffer ttItem:attach-data-source(data-source srcItem:handle,?,?).

query qOrder:query-prepare("for each Order").
dataset dsOrder:fill().

// detaching the data-sources

buffer ttOrder:detach-data-source().
buffer ttOLine:detach-data-source().
buffer ttItem:detach-data-source().

// display the data

for each ttOrder:
    display ttOrder.OrderNum
        ttOrder.OrderDate
        with frame ttOrderFrame 1 col title "ORDER".
    
    for each ttOLine of ttOrder:
        display ttOLine.OrderNum
            ttOLine.LineNum
            ttOLine.ItemNum
            ttOline.Price
            ttOLine.Qty
            ttOLine.Discount
            ttOLine.ExtendedPrice
            with frame ttOrderLineFrame 1 col title "ORDERLINE".
    end.
end.