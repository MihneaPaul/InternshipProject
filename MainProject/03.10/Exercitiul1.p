
/*------------------------------------------------------------------------
    File        : Exercitiul1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 03 14:16:56 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* Creati o functie care primeste ca si input un temp-table 
Customer apoi parcurce recordurile care au fost sterse
 din temp-table , pentru fiecare customer sters sa se 
 verifice daca exista recorduri in tabela Order pentru 
 acel customer , daca exista sa se puna un mesaj de 
 eroare pe ecran:  Customer “X” has active orders 
 and cannot be deleted */

/*define variable canDelete as logical init false no-undo.*/
define temp-table tmp like Customer
    field id       as integer 
    field custName as character format "x(20)"
    index id is primary id ascending.
/*    field orderDate as character format "x(15)".*/

define temp-table orderTmp like Order
    field custId  as integer
    field orderId as integer
    index orderId is primary orderId ascending.

for each Customer no-lock, each Order of Customer:
    create tmp.
    create orderTmp.
    assign 
        id       = Customer.CustNum
        custName = Customer.Name
        custId   = Order.CustNum
        orderId  = Order.OrderNum.
        if orderId <> 0 then
    delete tmp. 
    display id custName.
end.
