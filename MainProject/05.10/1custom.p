/* 1. Define the Temp-tables you wish to use in the ProDataSet. */

DEFINE TEMP-TABLE ttOrder BEFORE-TABLE ttOrderBefore
   FIELD OrderNum LIKE Order.OrderNum
   FIELD OrderDate LIKE Order.OrderDate
   FIELD CustName LIKE Customer.NAME
   FIELD Discount LIKE Customer.Discount
   FIELD RepName LIKE SalesRep.RepName
   INDEX OrderNum IS UNIQUE OrderNum.

DEFINE TEMP-TABLE ttOLine LIKE Orderline BEFORE-TABLE ttOLineBefore.

DEFINE TEMP-TABLE ttItem
   FIELD ItemNum LIKE Item.ItemNum
   FIELD ItemName LIKE Item.ItemName
   FIELD Price LIKE Item.Price
   INDEX ItemNum IS UNIQUE ItemNum.

/* 2. Define the ProDataSet by specifying the temp-tables (actually temp-table default buffers) and their relationships.
    As soon as a buffer to a temp-table is used in a dataset, that *table* is considered part of the dataset */

DEFINE DATASET dsOrder FOR ttOrder, ttOLine, ttItem
   DATA-RELATION drOrderLine FOR ttOrder, ttOLine RELATION-FIELDS (OrderNum,OrderNum)
   DATA-RELATION drLineItem FOR ttOLine, ttItem RELATION-FIELDS (ItemNum,ItemNum).

/* 3. Identify, define and attach the datasources to prepare FILLing dataset from the database */
DEFINE QUERY qOrder FOR Order .
DEFINE DATA-SOURCE srcOrder FOR QUERY qOrder
   Order KEYS (OrderNum) .
DEFINE DATA-SOURCE srcOLine FOR OrderLine.
DEFINE DATA-SOURCE srcItem FOR Item.

/* 4. Attach the datasources and do the FILL() */
BUFFER ttOrder:ATTACH-DATA-SOURCE(DATA-SOURCE srcOrder:HANDLE,?,?).
BUFFER ttOLine:ATTACH-DATA-SOURCE(DATA-SOURCE srcOLine:HANDLE,?,?).
BUFFER ttItem:ATTACH-DATA-SOURCE(DATA-SOURCE srcItem:HANDLE,?,?).

/* note that only the top-level query gets prepared. The queries for the child tables will be prepared automatically based on the data-relations */
QUERY qOrder:QUERY-PREPARE("FOR EACH ORDER").
DATASET dsOrder:FILL().

/* 5. Detaching the Data-Sources. */

/* Note that after the FILL operation, the data in the dataset has become independent of the data source (database).
The Data-source object no longer needs to be attached at this point, until another FILL or a save operation takes place. */

BUFFER ttOrder:DETACH-DATA-SOURCE().
BUFFER ttOLine:DETACH-DATA-SOURCE().
BUFFER ttItem:DETACH-DATA-SOURCE().

/* 6. Display the data */

FOR EACH ttOrder:
   DISPLAY ttOrder.OrderNum
           ttOrder.OrderDate
   WITH FRAME ttOrderFrame 1 COL TITLE "ORDER".


   FOR EACH ttOLine of ttOrder:
      DISPLAY ttOLine.OrderNum
              ttOLine.LineNum
              ttOLine.ItemNum
              ttOLine.Price
              ttOLine.Qty
              ttOLine.Discount
              ttOLine.ExtendedPrice
      WITH FRAME ttOrderLineFrame 1 COL TITLE "ORDERLINE".
   END.
END.