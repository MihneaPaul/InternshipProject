 
 /*------------------------------------------------------------------------
    File        : CustObj
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : demo
    Created     : Tue Oct 10 09:50:47 EEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS CustObj INHERITS CommonObj: 
    define public variable iNumCusts as integer no-undo.
    
    define protected temp-table ttCustomer no-undo
    field RecNum as integer
    field CustNum like Customer.CustNum
    field Name like Customer.Name
    field State as character.
    
/*    define private variable rMsg as class MsgObj no-undo.         */
/*    define private variable rCreditObj as class CreditObj no-undo.*/
END CLASS.