
/*------------------------------------------------------------------------
    File        : tempTablesExample3.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 11:54:02 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table catch-table
    field catch_contact as character format "x(20)"
    field catch_country as character format "x(20)"
    field catch_balance as decimal
    field catch_discout as integer   format "-z9%".

define input parameter table for catch-table.
for each catch-table no-lock:
    display catch-table.
end.