
/*------------------------------------------------------------------------
    File        : p1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 04:50:29 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// RUN p1.p then p2.p while p1.p still running.

find first Customer exclusive-lock.
MESSAGE Customer.Name
VIEW-AS ALERT-BOX.