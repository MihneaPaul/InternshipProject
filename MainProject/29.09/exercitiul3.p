
/*------------------------------------------------------------------------
    File        : exercitiul3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 11:24:51 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

//3. Comenzile care nu au fost onorate in maxim o saptamana

/*define variable dDateOrder as date no-undo.*/
/*define variable dDateShip as date no-undo. */

for each Customer no-lock:
    for each Order of Customer no-lock:
        if month(Order.OrderDate) = month(Order.ShipDate) and day(Order.ShipDate) > 7 + day(Order.OrderDate) then
            display Customer.Name format "x(15)"
                Order.Ordernum label "Same month"
                Order.OrderDate
                Order.ShipDate.
         if month(Order.OrderDate) <> month(Order.ShipDate)
                and day(add-interval(Order.OrderDate,7,"days")) < day(Order.ShipDate) then
/*                assign dDateOrder = Order.OrderDate.                      */
/*                dDateShip = Order.ShipDate.                               */
/*                if add-interval(Order.OrderDate,7,"days") < dDateShip then*/
                display Customer.Name format "x(15)"
                    Order.OrderNum 
                    Order.OrderDate
                    Order.ShipDate.        
    end.
end.

/*function hello returns char():                                                */
/*end function.                                                                 */
/*display hello().                                                              */
/*                                                                              */
/*                                                                              */
/*for each Customer where Customer.CustNum <= 5, each Order of Customer no-lock:*/
/*    display Customer.Name Order.OrderDate.                                    */
/*                                                                              */
/*    display add-interval(Order.OrderDate, 7,"days").                          */
/*    end.                                                                      */