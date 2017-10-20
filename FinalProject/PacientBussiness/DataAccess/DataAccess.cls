 
/*------------------------------------------------------------------------
   File        : DataAccess
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Mon Oct 16 15:32:54 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS PacientBussiness.DataAccess.DataAccess ABSTRACT:
    
    constructor public DataAccess():
        super().
    end constructor.
         
            
    method public void fetchData(input-output hdsPacient as handle):
        define var bufferHandle as handle no-undo.
        define var queryHandle  as handle no-undo.
                
        hdsPacient:fill().           
    end method.
                
    method public void storeData():
    end method.

END CLASS.