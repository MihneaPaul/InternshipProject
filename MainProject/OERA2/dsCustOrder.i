
/*------------------------------------------------------------------------
    File        : dsCustOrder.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 10 15:37:02 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table ttCustomer like Customer before-table btCustomer.
define temp-table ttOrder like Order before-table btOrder.

define dataset dsCustomerOrder for ttCustomer, ttOrder
data-relation drCustomerOrder for ttCustomer, ttOrder
relation-fields(CustNum,CustNum).