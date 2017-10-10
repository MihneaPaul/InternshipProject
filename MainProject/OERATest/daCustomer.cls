 
/*------------------------------------------------------------------------
   File        : daCustomer
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 11:41:56 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERATest.daCustomer: 
    {dsCustomer.i}
/*    {dsOrder.i}*/
/*    define dataset dsCustomer for ttCustomer.*/
    
    
    method public void fetchData(input-output hdsCustomer as handle):
    define data-source srcCustomer for Customer.
        buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
/*        dataset dsCustomerOrder:fill().*/
        dataset dsCustomer:fill().
        
        buffer ttCustomer:detach-data-source().
/*        hdsCustomer = dataset dsCustomerOrder:handle.*/
        hdsCustomer = dataset dsCustomer:handle.

       
    end method.
    
    method public void storeData():
    end method.
    

END CLASS.