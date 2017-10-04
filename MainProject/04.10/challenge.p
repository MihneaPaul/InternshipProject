/*define TEMP-TABLE ttCust like Customer.                                                                                                            */
/*define temp-table ttOrder like Order.                                                                                                              */
/*                                                                                                                                                   */
/*DEFINE DATASET dsCustomer FOR ttCust, ttOrder                                                                                                      */
/*   DATA-RELATION drCustomerOrder FOR ttCust, ttOrder RELATION-FIELDS (CustNum,CustNum).                                                            */
/*                                                                                                                                                   */
/*DEFINE QUERY qCustomer FOR Customer .                                                                                                              */
/*DEFINE DATA-SOURCE srcCustomer FOR QUERY qCustomer                                                                                                 */
/*   Customer KEYS (CustNum) .                                                                                                                       */
/*DEFINE DATA-SOURCE srcOrder FOR Order.                                                                                                             */
/*                                                                                                                                                   */
/*BUFFER ttCust:ATTACH-DATA-SOURCE(DATA-SOURCE srcCustomer:HANDLE,?,?).                                                                              */
/*BUFFER ttOrder:ATTACH-DATA-SOURCE(DATA-SOURCE srcOrder:HANDLE,?,?).                                                                                */
/*                                                                                                                                                   */
/*/* note that only the top-level query gets prepared. The queries for the child tables will be prepared automatically based on the data-relations */*/
/*QUERY qCustomer:QUERY-PREPARE("FOR EACH customer where state <> 'FL'").                                                                            */
/*DATASET dsCustomer:FILL().                                                                                                                         */

define temp-table ttCust before-table btCust
    field CustNum like Customer.CustNum
    field Nume    like Customer.Name
    index idxCustNum is unique CustNum.
/*    use-index name as primary.*/
    
define temp-table ttOrd before-table btOrd
    field OrderNum like Order.OrderNum
    field CustNum  like Order.CustNum
    field orderNume     like Customer.Name
    index idxTORderNum is unique OrderNum.

define variable hBuffer as handle no-undo.    
define dataset dsCustomer for ttCust, ttOrd
    data-relation drCustomerOrder for ttCust, ttOrd relation-field(CustNum, CustNum).
    
define query qCustomer for Customer.
define query qOrder for Order.


define data-source srcCustomer for query qCustomer
Customer keys (CustNum).
    
//care ii faza aici
define data-source srcOrder for query qOrder
Order keys (OrderNum,CustNum).
    
/*define data-source srcOrderB for query qOrder.*/

/*create data-source srcOrder.*/
/*create buffer hBuffer for table "ttCust" buffer-name "custBuffer".*/
/*dataset dsCustomer:add-buffer(hBuffer:default-buffer-handle).*/
/*data-source srcOrder:ADD-SOURCE-BUFFER (hBuffer,"idxCustNum").*/
buffer ttCust:ATTACH-DATA-SOURCE (data-source srcCustomer:HANDLE,"Customer.Name,Nume").
buffer ttOrd:ATTACH-DATA-SOURCE (data-source srcOrder:HANDLE,?,"Customer.Name,orderNume").
/*buffer ttOrd:attach-data-source(data-source srcCustomer:handle,"ttCust.Nume,ttOrd.orderNume",?).*/


query qCustomer:QUERY-PREPARE("for each customer where custnum < 10").

query qOrder:QUERY-PREPARE("for each order where custNum < 10").

dataset dsCustomer:FILL().

dataset dsCustomer:GET-BUFFER-HANDLE("ttCust"):SET-CALLBACK-PROCEDURE
    ("AFTER-ROW-FILL", "ttOrd", THIS-PROCEDURE).
/*dataset dsCustomer:write-json ("file", "c:\temp\dsCustomer.json", yes).*/

for each ttOrd no-lock:
    disp ttord.orderNume  ttOrd.CustNum ttord.OrderNum with width 400.
end.
for each ttCust no-lock:
       disp ttCust.CustNum ttCust.Nume.
end.  

