 
/*------------------------------------------------------------------------
   File        : beCustOrder
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 15:45:48 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERA2.beCustOrder: 
    {dsCustOrder.i}
    define var hdsCustOrder as handle            no-undo.
    define var daCustOrder  as OERA2.daCustOrder no-undo.
    
    constructor public beCustOrder():
        daCustOrder = new OERA2.daCustOrder().
    end constructor.
        
    method public void readCustomerAndOrder():
        define var dqCustOrder       as handle no-undo.
        define var hdsCustomerBuffer as handle no-undo.
        define var hdsOrderBuffer    as handle no-undo.
        
        daCustOrder:fetchData(hdsCustOrder).
        hdsCustomerBuffer = hdsCustOrder:get-buffer-handle("ttCustomer").
        hdsOrderBuffer = hdsCustOrder:get-buffer-handle("ttOrder").
        
        create query dqCustOrder.
        dqCustOrder:set-buffers(hdsCustomerBuffer,hdsOrderBuffer).
        dqCustOrder:query-prepare("for each ttCustomer where CustNum < 10, each ttOrder of ttCustomer where ShipDate <> ?").
        dqCustOrder:query-open().
        
        repeat:
            dqCustOrder:get-next().
            if dqCustOrder:query-off-end then leave.
            display 
                hdsCustomerBuffer::CustNum 
                hdsCustomerBuffer::Name
                hdsOrderBuffer::ShipDate.
        end.
    end method.

END CLASS.