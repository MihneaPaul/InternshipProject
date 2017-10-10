 
/*------------------------------------------------------------------------
   File        : beOrder
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 14:32:35 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERATest.beOrder: 
    {dsOrder2.i}
    define var hdsOrder as handle           no-undo.
    define var daOrder  as OERATest.daOrder no-undo.
    
    constructor public beOrder():
        daOrder = new OERATest.daOrder().
    end constructor.
    
    method public void readOrder():
        define var dqOrder        as handle no-undo.
        define var hdsOrderBuffer as handle no-undo.
        daOrder:fetchData(hdsOrder).
        hdsOrderBuffer = hdsOrder:get-buffer-handle("ttOrder").
        create query dqOrder.
        dqOrder:set-buffers(hdsOrderBuffer).
        dqOrder:query-prepare("for each ttOrder").
        dqOrder:query-open.
        
        repeat:
            dqOrder:get-next().
            if dqOrder:query-off-end then leave.
            display 
               hdsOrderBuffer::ShipDate.
        end.
    end method.

END CLASS.