 
/*------------------------------------------------------------------------
   File        : daCustOrder
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 15:41:00 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERA2.daCustOrder: 
    {dsCustOrder.i}
    
    method public void fetchData(input-output hdsCustOrder as handle):
        define data-source srcCustomer for Customer.
        define data-source srcOrder    for Order.
        buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
        buffer ttOrder:attach-data-source(data-source srcOrder:handle).
        dataset dsCustomerOrder:fill().
        
        buffer ttCustomer:detach-data-source().
        buffer ttOrder:detach-data-source().
        hdsCustOrder = dataset dsCustomerOrder:handle.
    end method.
        
    method public void storeData():
    end method.

END CLASS.