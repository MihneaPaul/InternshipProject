
/*------------------------------------------------------------------------
    File        : exercitiul3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 03:49:17 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
do transaction:
    FIND LAST Customer WHERE Customer.city = "Newark" EXCLUSIVE-LOCK.
    if available Customer then
        FOR EACH Order OF Customer EXCLUSIVE-LOCK:
            FOR EACH OrderLine OF Order EXCLUSIVE-LOCK:
                IF AVAILABLE OrderLine THEN 
                DO:
                    DELETE OrderLine.
                END.
            END.
            DELETE Order.
        END.
    DELETE Customer.
END.






/*define variable bh as handle no-undo.                */
/*define variable orderBh as handle no-undo.           */
/*                                                     */
/*bh = buffer Customer:handle.                         */
/*orderBh = buffer Order:handle.                       */
/*                                                     */
/*bh:find-last('where Customer.City = "Newark"').      */
/*orderBh:find-first('where Customer.City = "Newark"').*/
/*do transaction:                                      */
/*    orderBh:buffer-delete().                         */
/*    bh:buffer-delete().                              */
/*end.        

                                         */
