
/*------------------------------------------------------------------------
    File        : p2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 04:52:36 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// RUN p2.p after p1.

find first Customer exclusive-lock.
MESSAGE Customer.Name
VIEW-AS ALERT-BOX.