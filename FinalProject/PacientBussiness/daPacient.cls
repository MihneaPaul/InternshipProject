 
/*------------------------------------------------------------------------
   File        : daPacient
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Mon Oct 16 15:35:47 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS PacientBussiness.daPacient inherits PacientBussiness.DataAccess: 
    {ttPacient.i}.
    
    define dataset dsPacient for ttPacient.
    define data-source srcPacient for Pacient.
    
    method public void fetchData(input-output hdsPacient as handle, input filter as character):
        define var tableHandle as handle no-undo.
        define var queryHandle as handle no-undo.
        
        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
        hdsPacient = dataset dsPacient:handle.
        
        super:fetchData(hdsPacient).
        buffer ttPacient:detach-data-source().
        tableHandle = hdsPacient:get-buffer-handle("ttPacient").
        
        create query queryHandle.
        queryHandle:set-buffers(tableHandle).
/*        MESSAGE "trif was here " filter*/
/*        VIEW-AS ALERT-BOX.             */
        queryHandle:query-prepare("for each ttPacient where " + filter).
        queryHandle:query-open() no-error.
        
       
        repeat:
            queryHandle:get-next().
            if queryHandle:query-off-end then
                leave.
/*            display tableHandle::pacNum label "ID" */
/*                tableHandle::Name label "Name"     */
/*                tableHandle::E-mail label "E-mail".*/
        end.       
    end method.

END CLASS.