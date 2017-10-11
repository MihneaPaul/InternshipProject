 
/*------------------------------------------------------------------------
   File        : beCustomer
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Wed Oct 11 14:24:32 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS GenericOERA.beCustomer: 
    {dsCustomer.i}
    define private var dataAccessCustomer as GenericOERA.daCustomer.
    
    constructor public beCustomer():
        dataAccessCustomer = new GenericOERA.daCustomer().
    end constructor.
        
    method public void displayCustomerByCustNum(input custNum as char):
        define var hdsCustomer1 as handle no-undo.
        define var hdsOrder    as handle no-undo.
        define var filter      as char.

        filter = ".CustNum < " + quoter(custNum).
        hdsCustomer1 = dataset dsCustomer:handle.
        hdsOrder = dataset dsCustomer:handle.

       
/*        dataAccessCustomer:fetchData1(input-output hdsCustomer,input filter).*/
        dataAccessCustomer:fetchDataoo(input-output hdsCustomer1,input filter).
    end method.
    
    method public void displayCustomerByCity(input city as char):
        define var hdsCustomer1 as handle no-undo.
        define var hdsOrder1    as handle no-undo.
        define var filter      as char.
        
        filter = ".city = " + quoter(city).
        hdsCustomer1 = dataset dsCustomer:handle.
        hdsOrder1 = dataset dsCustomer:handle.
        
        dataAccessCustomer:fetchData(input-output hdsCustomer1, input-output hdsOrder1, filter).
    end method.
    
END CLASS.