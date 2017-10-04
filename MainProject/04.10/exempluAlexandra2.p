
/*------------------------------------------------------------------------
    File        : exempluAlexandra2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 04 13:18:27 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// tt definitions

define temp-table ttOrder before-table ttOrderBefore
    field OrderNum    as integer format "zzzzzzz9"
    field OrderDate   as date    format "99/99/9999"
    field ShipDate    as date    format "99/99/9999"
    field PromiseDate as date    format "99/99/9999"
    field OrderTotal  as decimal format "->,>>>,>>9.99"
    index OrderNum is unique primary OrderNum.

define temp-table ttOrderLine before-table ttOrderLineBefore
    field ORderNum      as integer format "zzzzzzz9"
    field LineNum       as integer format ">>9"
    field ItemNum       as integer format "zzzzzzz9"
    field Price         as decimal format "->,>>>,>>9.99"
    field Qty           as integer format "->>>>9"
    field Discount      as integer format ">>9%"
    field ExtendedPrice as decimal format "->>>,>>9.99"
    index OrderNum_LineNum is unique primary OrderNum LineNum.

// ProDataSet definition

define dataset dsOrderOrderLine for ttOrder, ttOrderLine
    data-relation drOrderOrderLine for ttOrder, ttOrderLine
    relation-fields (OrderNum, OrderNum).

// Data-Source definition

define query qOrder for Order.

define data-source srcOrder for query qOrder.
define data-source srcOrderLine for OrderLine.

// Attach data sources

buffer ttOrder:attach-data-source(data-source srcOrder:handle).
buffer ttOrderLine:attach-data-source(data-source srcOrderLine:handle,?,?).


// Prepare Query

query qOrder:query-prepare("for each Order where OrderNum < 2").

MESSAGE temp-table ttOrderBefore:after-table:primary skip
    temp-table ttOrder:before-table:primary skip
    temp-table ttOrderLineBefore:after-table:name skip
    temp-table ttOrderLine:before-table:name skip
    buffer ttOrderBefore:after-buffer:name skip
    buffer ttOrder:before-buffer:name skip
    buffer ttOrderLineBefore:after-buffer:name skip
    buffer ttOrderLine:before-buffer:name skip
    VIEW-AS ALERT-BOX INFO BUTTONS OK.

dataset dsOrderOrderLine:fill().

for each ttOrder:
    display ttOrder.OrderNum
        ttOrder.OrderDate
        ttOrder.ShipDate
        ttOrder.PromiseDate
        ttOrder.OrderTotal with frame ttOrderFrame 1 col title "Order".
    
    for each ttOrderLine of ttOrder:
        display ttOrderLine.OrderNum
            ttOrderLine.LineNum
            ttOrderLine.ItemNum
            ttOrderLine.Price
            ttOrderLine.Qty
            ttOrderLine.Discount
            ttOrderLine.ExtendedPrice with frame ttORderLineFrame 1 col title "Order Lines".
        
        update ttOrderLine.Qty with frame ttOrderLineFrame.
    end.
end.
        
MESSAGE temp-table ttOrderBefore:after-table:has-records skip
    temp-table ttOrder:before-table:primary skip
    temp-table ttOrderLineBefore:after-table:name skip
    temp-table ttOrderLine:before-table:name skip
    buffer ttOrderBefore:after-buffer:name skip
    buffer ttOrder:before-buffer:name skip
    buffer ttOrderLineBefore:after-buffer:name skip
    buffer ttOrderLine:before-buffer:name skip
        
    VIEW-AS ALERT-BOX INFO BUTTONS OK.
        
for each ttOrderLineBefore:
    display ttOrderLineBefore.
end.