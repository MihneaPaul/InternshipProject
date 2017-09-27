
/*------------------------------------------------------------------------
    File        : exercitiul3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Sep 25 05:22:38 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* 3. Calculati totalul Comenzilor date de clientii din afara statului Florida. */

DEFINE VARIABLE iNumberOfOrders AS INTEGER NO-UNDO INIT 0.
DEFINE VARIABLE lisFlorida      AS LOGICAL. 


FOR EACH Customer:
    FOR EACH Order OF Customer:
        IF Customer.State MATCHES "FL" THEN
            ASSIGN lisFlorida = YES.
        ELSE
        DO:
            IF Order.OrderDate NE ? THEN
            DO:
                ASSIGN
                    iNumberOfOrders = iNumberOfOrders + 1.
            END.
        END.
                                              
        ACCUMULATE Order.Ordernum (COUNT).
    END.
END.
DISPLAY "Count = " (ACCUM COUNT Order.Ordernum).
DISPLAY iNumberOfOrders  LABEL "Total Number of Orders".

/* NEW VERSION CALCULATING TOTAL PRICE */

define variable iTotalPrice as integer no-undo.

for each Customer where Customer.State <> "FL",
    each Order of Customer,
    each OrderLine of Order no-lock:
        assign iTotalPrice = iTotalPrice + OrderLine.Qty * (OrderLine.Price - OrderLine.Price * OrderLine.Discount / 100).

 end.      
 display "Total price: " iTotalPrice. 
       