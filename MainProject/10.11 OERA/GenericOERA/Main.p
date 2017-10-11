
/*------------------------------------------------------------------------
    File        : Main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 11 14:30:06 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define var obj as GenericOERA.beCustomer.

obj = new GenericOERA.beCustomer().

obj:displayCustomerByCustNum("21").
/*obj:displayCustomerByCity("Boston").*/
/*obj:displayCustomerByCity("New York").*/
/*obj1:displayCustomerByCity("a").*/
