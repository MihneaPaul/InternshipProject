
/*------------------------------------------------------------------------
    File        : dsOrder2.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 10 15:08:30 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
define temp-table ttOrder like Order before-table btOrder.

define dataset dsOrder for  ttOrder.