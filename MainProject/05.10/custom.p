
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
    
define dataset dstCustOrder for ttCustomer.
    
define query qCustomer for Customer.
    
define data-source srcCustomer for query qCustomer.

buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
    
query qCustomer:query-prepare("for each Customer").

dataset dstCustOrder:fill().

dataset dstCustOrder:write-xml("file","c:\tmp\dstCustOrder.xml",true). 
for each ttCustomer no-lock:
    display ttCustomer.Name
        ttCustomer.CustNum
        with frame ttCustFrame 1 col title "Customer".
end.
