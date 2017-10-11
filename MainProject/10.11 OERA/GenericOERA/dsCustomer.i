
/*------------------------------------------------------------------------
    File        : dsCustomer.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 11 14:12:03 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

{ttCustomer.i}
{ttOrder.i}
define dataset dsCustomer for ttCustomer, ttOrder
data-relation drCustOrder for ttCustomer, ttOrder
relation-fields(CustNum,CustNum).