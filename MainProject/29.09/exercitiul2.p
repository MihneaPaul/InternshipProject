
/*------------------------------------------------------------------------
    File        : exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 10:26:42 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//Suma de plata pentru fiecare ultima comanda a Clientilor din Florida.

function totalCost returns decimal (input stateName as char) forward.
define variable cost as decimal no-undo.

totalCost("FL").

function totalCost returns decimal (input stateName as char):
   
    find first Customer where Customer.State = stateName no-lock no-error.
    repeat:
        find next Customer where Customer.State = stateName no-lock no-error.
        if available Customer then
            find last Order of Customer no-lock no-error.
        else leave.            
        if available Order then 
        display Customer.Name Customer.State Order.OrderDate.
            for each OrderLine of Order no-lock:
                assign 
                    cost = cost + OrderLine.Price.
                display OrderLine label "OrderLine" 
                cost label "Cost". 
                end.   
/*        else leave.*/
            end.  
        
    /*    for each Customer where Customer.State = stateName, each Order of Customer no-lock:*/
   
    end function.