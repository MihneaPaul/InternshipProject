 
/*------------------------------------------------------------------------
   File        : daCustomer
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Wed Oct 11 14:14:14 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS GenericOERA.daCustomer inherits GenericOERA.DataAccess:
    
    {ttCustomer.i}
    {ttOrder.i}
    define private dataset dsCustomer for ttCustomer, ttOrder.
    define data-source srcCustomer for Customer.
    define data-source srcOrder for Order.
    
    constructor public daCustomer():
        super().
    end constructor.
        
    method public void fetchData(input-output hdsCustomer as handle, input-output hdsOrder as handle, input filterString as char): 
        define var custTableHandle    as handle no-undo.
        define var orderTableHandle   as handle no-undo.
        define var queryHandle        as handle no-undo.
        define var anotherQueryHandle as handle no-undo.
            
        buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
        buffer ttOrder:attach-data-source(data-source srcOrder:handle).
        
        hdsCustomer = dataset dsCustomer:handle.
        hdsOrder = dataset dsCustomer:handle.
        
        super:fetchData(hdsCustomer).
        super:fetchData(hdsOrder).
        
        buffer ttCustomer:detach-data-source().
        buffer ttOrder:detach-data-source().
    
        custTableHandle = hdsCustomer:get-buffer-handle("ttCustomer").
        orderTableHandle = hdsOrder:get-buffer-handle("ttOrder").
    
        create query queryHandle.
        queryHandle:set-buffers(custTableHandle).
        queryHandle:query-prepare("for each ttCustomer where ttCustomer " + filterString).
        queryHandle:query-open() no-error.
        
        create query anotherQueryHandle.
        anotherQueryHandle:set-buffers(custTableHandle, orderTableHandle).
        anotherQueryHandle:query-prepare("preselect each ttCustomer where ttCustomer " + filterString + ", each ttOrder where ShipDate <> ?").
        anotherQueryHandle:query-open() no-error.
        
        /*        repeat:                              */
        /*            queryHandle:get-next().          */
        /*            if queryHandle:query-off-end then*/
        /*                leave.                       */
        /*            display custTableHandle::custNum */
        /*                custTableHandle::name.       */
        /*        end.                                 */
        
        repeat:
            anotherQueryHandle:get-next().            
            if anotherQueryHandle:query-off-end then
                leave.            
            display 
                custTableHandle::Name
                orderTableHandle::ShipDate
                orderTableHandle::OrderStatus.
             
        end.
    end method.
    
    method public void fetchDataoo(input-output hdsCustomer1 as handle, input filterString as char): 
        define var custTableHandle1 as handle no-undo.    
        define var orderTableHandle1 as handle no-undo.   
        define var queryHandle1     as handle no-undo. 
              
        buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).  
        buffer ttOrder:attach-data-source(data-source srcOrder:handle). 
        hdsCustomer1 = dataset dsCustomer:handle.
           
        super:fetchData(hdsCustomer1).
        buffer ttCustomer:detach-data-source().
        custTableHandle1 = hdsCustomer1:get-buffer-handle("ttCustomer").

        create query queryHandle1.
        queryHandle1:set-buffers(custTableHandle1).
        queryHandle1:query-prepare("for each ttCustomer where ttCustomer " + filterString).
        queryHandle1:query-open() no-error.

        repeat:
            queryHandle1:get-next().
            if queryHandle1:query-off-end then
                leave.
            display custTableHandle1::custNum
                custTableHandle1::name.
        end.        

    end method.
    
    method override public void storeData():
    end method.

END CLASS.