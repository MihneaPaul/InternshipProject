
/*------------------------------------------------------------------------
    File        : exx.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 02:11:42 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE VARIABLE iNum AS INTEGER NO-UNDO.
DO FOR Customer:
FOR EACH Customer NO-LOCK WHERE Customer.CreditLimit > 80000
BY Customer.CreditLimit DESCENDING:
DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.
if iNum = 0 then
    iNum = Customer.CustNum. 
END.
FIND Customer NO-LOCK WHERE Customer.CustNum = iNum.
DISPLAY
Customer.NAme FORMAT "x(18)"
Customer.City FORMAT "x(12)"
Customer.State FORMAT "x(12)"
Customer.Country FORMAT "x(12)".
END.
