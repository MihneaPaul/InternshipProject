
/*------------------------------------------------------------------------
    File        : Main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 10 16:07:24 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */


def var beCustOrderTest as OERA2.beCustOrder no-undo.
beCustOrderTest = new OERA2.beCustOrder().
beCustOrderTest:readCustomerAndOrder().