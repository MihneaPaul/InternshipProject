
/*------------------------------------------------------------------------
    File        : dsCustomer.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 10 11:40:32 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/*{dsOrder.i}*/
define temp-table ttCustomer like Customer before-table btCustomer.

/*define dataset dsCustomerOrder for ttCustomer, ttOrder*/
/*data-relation drCustOrder for ttCustomer, ttOrder     */
/*relation-fields(CustNum,CustNum).                     */

define dataSet dsCustomer for ttCustomer.