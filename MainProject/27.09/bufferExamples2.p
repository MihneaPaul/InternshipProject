
/*------------------------------------------------------------------------
    File        : bufferExamples2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 01:11:54 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/*DEFINE VARIABLE iNum AS INTEGER NO-UNDO.                           */
/*DO FOR Customer:                                                   */
/*    FOR EACH Customer NO-LOCK WHERE Customer.CreditLimit > 80000   */
/*        BY Customer.CreditLimit DESCENDING:                        */
/*        DISPLAY Customer.CustNum Customer.Name Customer.CreditLimit*/
/*        iNum = Customer.CustNum WHEN iNum = 0.                     */
/*    END.                                                           */
/*    FIND Customer NO-LOCK WHERE Customer.CustNum = iNum.           */
/*    DISPLAY                                                        */
/*        Customer.NAme FORMAT "x(18)"                               */
/*        Customer.City FORMAT "x(12)"                               */
/*        Customer.State FORMAT "x(12)"                              */
/*        Customer.Country FORMAT "x(12)".                           */
/*END.                                                               */
find first customer no-lock.

/*REPEAT:                                       */
/*    FIND next Customer NO-LOCK .              */
/*                                              */
/*    IF index(Customer.name,"d") > 1 THEN NEXT.*/
/*    ELSE LEAVE.                               */
/*    MESSAGE 1                                 */
/*        VIEW-AS ALERT-BOX.                    */
/*    DISPLAY Customer.CustNum Customer.Name.   */
/*    MESSAGE 2                                 */
/*        VIEW-AS ALERT-BOX.                    */
/*END.                                          */
REPEAT:
FIND NEXT Customer NO-LOCK USE-INDEX NAME.
IF NAME < "D" THEN NEXT.
ELSE LEAVE.

END.
DISPLAY Customer.CustNum Customer.Name.


/*REPEAT:                                                     */
/*    FIND NEXT Customer NO-LOCK USE-INDEX NAME.              */
/*    IF Customer.Name BEGINS "D" THEN                        */
/*    DO:                                                     */
/*        DISPLAY Customer.CustNum Customer.Name WITH FRAME D.*/
/*        LEAVE.                                              */
/*    END.                                                    */
/*END.                                                        */
/*                                                            */
/*REPEAT:                                                     */
/*    FIND NEXT Customer NO-LOCK USE-INDEX NAME.              */
/*    IF NAME BEGINS "E" THEN                                 */
/*    DO:                                                     */
/*        DISPLAY Customer.CustNum Customer.Name WITH FRAME E.*/
/*        LEAVE.                                              */
/*    END.                                                    */
/*END.                                                        */