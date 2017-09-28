
/*------------------------------------------------------------------------
    File        : ClientMove.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 01:38:49 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/*define buffer xcust for Customer.     */
/*create customer.                      */
/*customer.custnum = 7777.              */
/*customer.name = "Cartof".             */
/*validate customer.                    */
/*find xcust where xcust.custnum = 7777.*/

find Customer where Customer.CustNum = 7777.
do transaction.
    assign 
        Customer.Address = "iauzi 14".
end.

for each Customer where Customer.CustNum = 7777:
    display Customer.CustNum Customer.Name Customer.Address.
end.

    