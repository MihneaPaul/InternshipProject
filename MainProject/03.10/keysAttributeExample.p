
/*------------------------------------------------------------------------
    File        : keysAttributeExample.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 03 10:05:30 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable hSource as handle no-undo.
define query qOrder for Order scrolling.
create data-source hSource.

hSource:query = query qOrder:handle.

hSource:add-source-buffer (buffer Order:handle,'CustNum,OrderNum').

MESSAGE hSource:keys
VIEW-AS ALERT-BOX.