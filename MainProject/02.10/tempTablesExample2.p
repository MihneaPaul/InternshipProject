
/*------------------------------------------------------------------------
    File        : tempTablesExample2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 11:09:57 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table ttOline like OrderLine
    field ItemName    like Item.ItemName
    field TotalWeight as decimal label "Tot.Wgt.".

define input parameter piOrderNum as integer no-undo.
define output parameter table for ttOline.

for each Orderline no-lock where Orderline.OrderNum = piOrderNum,
    Item of OrderLine no-lock:
    create ttOline.
    buffer-copy OrderLine to ttOline.
        assign 
        ttOline.ItemName = Item.ItemName
        ttOline.TotalWeight = OrderLine.Qty * Item.Weight.
end.