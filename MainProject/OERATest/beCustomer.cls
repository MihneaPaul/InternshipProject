 
/*------------------------------------------------------------------------
   File        : beCustomer
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 12:18:17 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERATest.beCustomer: 
    {dsCustomer.i}
    define var hdsCustomer as handle              no-undo.    
    define var daCustomer  as OERATest.daCustomer no-undo.      
        
    constructor public beCustomer():
        daCustomer = new OERATest.daCustomer().
    end constructor.
        
    method public void readCustomer():
        MESSAGE 1
            VIEW-AS ALERT-BOX.
        define var dqCustomer        as handle no-undo.
        define var hdsCustomerBuffer as handle no-undo.
        daCustomer:fetchData(hdsCustomer).       
        hdsCustomerBuffer = hdsCustomer:get-buffer-handle("ttCustomer").        
        create query dqCustomer.      
        dqCustomer:set-buffers(hdsCustomerBuffer).        
        dqCustomer:query-prepare("for each ttCustomer where CustNum < 10 and ShipDate <> ?").        
        dqCustomer:query-open.
        MESSAGE 2
            VIEW-AS ALERT-BOX.
            
        repeat:
            dqCustomer:get-next().
            if dqCustomer:query-off-end then leave.  
            display 
                hdsCustomerBuffer::CustNum hdsCustomerBuffer::Name.
        end.
        MESSAGE 3
            VIEW-AS ALERT-BOX.
    end method.                        
       
END CLASS.