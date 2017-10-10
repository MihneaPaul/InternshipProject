
/*------------------------------------------------------------------------
    File        : test.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 10 12:29:48 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
         
BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

def var beCustTest as OERATest.beCustomer no-undo.
def var beOrderTest as OERATest.beOrder no-undo.

beCustTest = new OERATest.beCustomer().
beOrderTest = new OERATest.beOrder().

beCustTest:readCustomer().
beOrderTest:readOrder().
