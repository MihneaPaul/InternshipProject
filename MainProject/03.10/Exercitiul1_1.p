
/*------------------------------------------------------------------------
    File        : Exercitiul1_1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 03 14:46:42 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// continuare exercitiu 1

define temp-table mainTT like Customer
    /*field custNum as integer*/
    field custName  as character format "x(20)"
    field custId    as integer
    field orderDate as date.

/*define temp-table orderTT like Order*/
/*field orderDat as character.        */

do:
    for each Customer no-lock:
        create mainTT.
        assign 
            custName = Customer.Name
            custId   = Customer.CustNum.
        for each Order of Customer exclusive-lock:
            orderDate = Order.OrderDate.
        end.
    end.
    run Exercitiul1.p (input table mainTT).
end.

