 
/*------------------------------------------------------------------------
   File        : daEmployee
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Fri Oct 13 12:23:05 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS ExercitiuMeeting.daEmployee inherits ExercitiuMeeting.DataAccess: 
    {ttEmployee.i}.
    /*{dsEmployee.i}.*/

    define dataset dsEmployee for ttEmployee.
    define data-source srcEmployee for Employee.

    constructor public daEmployee():
        super().
    end constructor.
    
    method public void fetchData(input-output hdsEmployee as handle, input filter as character):
        define var empTableHandle as handle no-undo.       
        define var queryHandle    as handle no-undo. 
              
        buffer ttEmployee:attach-data-source(data-source srcEmployee:handle).  
        hdsEmployee = dataset dsEmployee:handle.
           
        super:fetchData(hdsEmployee).
        buffer ttEmployee:detach-data-source().
        empTableHandle = hdsEmployee:get-buffer-handle("ttEmployee").

        create query queryHandle.
        queryHandle:set-buffers(empTableHandle).
        queryHandle:query-prepare("for each ttEmployee where ttEmployee " + filter).
        queryHandle:query-open() no-error.

        repeat:
            queryHandle:get-next().
            if queryHandle:query-off-end then
                leave.
            display empTableHandle::empNum label "EmpNum"
                empTableHandle::FirstName label "First Name"
                empTableHandle::LastName label "Last Name".
        end.        

    end method.
        
END CLASS.