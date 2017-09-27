
/*------------------------------------------------------------------------
    File        : bufferExamples1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 00:35:46 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* SCOPING */

/*~ INVALID CODE 1 ~                                                    */
/*                                                                    */
/*DEFINE VARIABLE fLimit AS DECIMAL NO-UNDO.                          */
/*FOR EACH Customer NO-LOCK WHERE Customer.State = "NH"               */
/*    BY Customer.CreditLimit DESCENDING:                             */
/*    DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.    */
/*    fLimit = Customer.CreditLimit.                                  */
/*    FOR EACH Customer NO-LOCK WHERE Customer.CreditLimit > fLimit:  */
/*        DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.*/
/*    END.                                                            */
/*END. */


/*~ INVALID CODE 2~                                                   */
/*                                                                    */
/*DEFINE VARIABLE fLimit AS DECIMAL NO-UNDO.                          */
/*FOR EACH Customer NO-LOCK WHERE Customer.State = "NH"               */
/*    BY Customer.CreditLimit DESCENDING:                             */
/*    DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.    */
/*    fLimit = Customer.CreditLimit.                                  */
/*    FIND FIRST Customer NO-LOCK WHERE Customer.CreditLimit > fLimit.*/
/*    DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.    */
/*END.                                                                */

/* VALID CODE */

DEFINE VARIABLE fLimit AS DECIMAL NO-UNDO.
FOR EACH Customer NO-LOCK WHERE Customer.State = "NH"
    BY Customer.CreditLimit DESCENDING:
    IF fLimit = 0 THEN
        fLimit = Customer.CreditLimit.
    DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.
END.
FIND FIRST Customer WHERE Customer.CreditLimit > fLimit.
DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit Customer.State.


/*~ INVALID CODE 3 ~                                              */
/*                                                                */
/*DO FOR Customer:                                                */
/*    FIND FIRST Customer NO-LOCK WHERE Customer.State = "MA".    */
/*    DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.*/
/*    fLimit = Customer.CreditLimit.                              */
/*END.                                                            */
/*FIND FIRST Customer NO-LOCK WHERE Customer.CreditLimit > fLimit.*/
/*DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit.    */


