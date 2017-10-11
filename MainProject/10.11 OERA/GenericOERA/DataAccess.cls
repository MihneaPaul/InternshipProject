 
/*------------------------------------------------------------------------
   File        : DataAccess
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Wed Oct 11 14:00:16 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS GenericOERA.DataAccess ABSTRACT: 

    constructor public DataAccess():
        super().
    end constructor.
    
    destructor public DataAccess():
    end destructor.
        
    method public void fetchData(input-output hdsCustomer as handle):
        define var bufferHandle as handle no-undo.
        define var queryHandle  as handle no-undo.
        
        hdsCustomer:fill(). 
        
    end method.  
    
    method public abstract void storeData().
END CLASS.