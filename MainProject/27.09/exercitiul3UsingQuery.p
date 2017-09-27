
/*------------------------------------------------------------------------
    File        : exercitiul3UsingQuery.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 03:42:16 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable iCount as integer no-undo.
define query hQuery for Customer, Order.

open query hQuery for each Customer where Customer.State <> "FL", each Order of Customer.
get first hQuery.
do while not query-off-end("hQuery"):
    
    
    if(Order.OrderDate <> ?) then
        assign iCount = iCount + 1.
   display customer.state with frame state 20 down.
   get next hQuery.
   down with frame state.
   end. 
   display "No. of orders: " iCount.
   
     