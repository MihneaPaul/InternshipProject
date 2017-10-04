
/*------------------------------------------------------------------------
    File        : exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 04 14:15:52 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//    • Fill dataset with data from Customer,
// Order & Order lines for a specific customer using 
// datasets

define temp-table ttCustomer like Customer.

define dataset dCustomer for ttCustomer.
define query qCustomer for Customer.
define data-source dsCustomer for query qCustomer.
buffer ttCustomer:attach-data-source(data-source dsCustomer:handle,?,?).
query qCustomer:query-prepare("for each Customer where Customer.CustNum = 2").
dataset dCustomer:fill().


for each ttCustomer where ttCustomer.CustNum = 2:
    display ttCustomer.Name with frame A title "Customer" 4 down width 90 .
    end.
    