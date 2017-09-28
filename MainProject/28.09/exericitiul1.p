
/*------------------------------------------------------------------------
    File        : exericitiul1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 01:55:11 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// FIRST VERSION

find first Customer where Customer.City = "Boston".

if available Customer then
do transaction.
    assign
        Customer.State = "Florida".
    validate Customer.
end.
display Customer.Name Customer.State Customer.City.

// SECOND VERSION

/*define variable qh as widget-handle.                                                                               */
/*                                                                                                                   */
/*create query qh.                                                                                                   */
/*qh:set-buffers(buffer Customer:handle).                                                                            */
/*qh:query-prepare('for each Customer where Customer.City = "Boston" and Customer.State = "Florida" exclusive-lock').*/
/*qh:query-open.                                                                                                     */
/*                                                                                                                   */
/*qh:get-first().                                                                                                    */
/*assign State = "iauzi".                                                                                            */
/*                                                                                                                   */
/*qh:query-close().                                                                                                  */
/*delete object qh.                                                                                                  */
/*display Customer.Name Customer.State Customer.City.                                                                */