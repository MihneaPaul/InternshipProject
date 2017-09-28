
/*------------------------------------------------------------------------
    File        : exercitiul3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 03:31:25 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
define variable deleteCust as logical no-undo format "y/n".

repeat:
  prompt-for Customer.Name.
  find first Customer using Customer.Name.
  display Customer.Name.
  deleteCust = no.
  update deleteCust label "Enter ""y"" to confirm delete".
  if deleteCust then delete Customer.
  leave.
end.