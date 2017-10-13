 
/*------------------------------------------------------------------------
   File        : DataAccess
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Fri Oct 13 12:30:58 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS ExercitiuMeeting.DataAccess ABSTRACT: 

    constructor public DataAccess():
        super().
    end constructor.
    
    destructor public DataAccess():
    end destructor.
        
    method public void fetchData(input-output hdsEmployee as handle):
        define var bufferHandle as handle no-undo.
        define var queryHandle  as handle no-undo.
        
        hdsEmployee:fill(). 
        
    end method.  
END CLASS.