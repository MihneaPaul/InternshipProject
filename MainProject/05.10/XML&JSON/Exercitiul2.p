
/*------------------------------------------------------------------------
    File        : Exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Oct 05 13:00:38 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table ttCustomer like Customer.
define temp-table ttOrder like Order.

define dataset dstCustomer for ttCustomer, ttOrder
data-relation drCustomerOrder for ttCustomer, ttOrder
relation-fields (CustNum,CustNum).

define query qCustomer for Customer.
define data-source srcCustomer for query qCustomer
Customer keys (CustNum).
define data-source srcOrder for Order.

buffer ttCustomer:attach-data-source(data-source srcCustomer:handle,?,?).
buffer ttOrder:attach-data-source(data-source srcOrder:handle,?,?).

query qCustomer:query-prepare("for each Customer where Customer.CustNum < 7").
dataset dstCustomer:fill().

dataset dstCustomer:write-json("file","D:\workspace\MainProject\05.10\XML&JSON\Files\jsonTest.json",yes).
dataset dstCustomer:write-xml("file","D:\workspace\MainProject\05.10\XML&JSON\Files\xmlTest.xml",yes).

