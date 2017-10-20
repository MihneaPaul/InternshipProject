 
/*------------------------------------------------------------------------
   File        : bePacient
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Mon Oct 16 16:21:23 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS PacientBussiness.BussinessEntity.bePacient: 
    
    {dsPacient.i}
    define var hdsPacient    as handle                                no-undo.
    define var daPacient     as PacientBussiness.DataAccess.daPacient no-undo.
    define var newHdsPacient as handle                                no-undo.
    
    constructor public bePacient():
        daPacient = new PacientBussiness.DataAccess.daPacient().
    end constructor.
    
    method public character returnName(input filterFirstName as char):

        define var dqPacient        as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.
        define var tableNameString  as char   no-undo.
        define var fullFilter       as char   no-undo.
        define var returnString     as char   no-undo.
        define var fullName         as char   no-undo.
        define var dq2Pacient       as handle no-undo.
        
        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName).
        daPacient:fetchData(hdsPacient, fullFilter).
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        create query dqPacient.
        dqPacient:set-buffers(hdsPacientBuffer).
        dqPacient:query-prepare("for each ttPacient where " + fullFilter).
        dqPacient:query-open(). 
        
        dqPacient:get-first().
        
        repeat:
            if dqPacient:query-off-end then leave.      
            else 
            do:
                fullName = string(hdsPacientBuffer::FirstName) + " " + string(hdsPacientBuffer::LastName).
                returnString = returnString + fullName + ",".
                dqPacient:get-next() no-error.         
            end.
        end. 

        fullFilter = "ttPacient.LastName = " + quoter(filterFirstName).

        daPacient:fetchData(newHdsPacient,fullFilter).

        hdsPacientBuffer = newHdsPacient:get-buffer-handle("ttPacient").
        create query dq2Pacient.
        dq2Pacient:set-buffers(hdsPacientBuffer).
        dq2Pacient:query-prepare("for each ttPacient where " + fullFilter).
        dq2Pacient:query-open().

        dq2Pacient:get-first().

        repeat:
            if dq2Pacient:query-off-end then leave.
            else
            do:
                fullName = string(hdsPacientBuffer::FirstName) + " " + string(hdsPacientBuffer::LastName).
                returnString = returnString + fullName + ",".
                dq2Pacient:get-next() no-error.
            end.
        end.
        return returnString.
    end method.
    
    method public character returnName(input filterFirstName as char, input filterLastName as char): 
      
        define var dqPacient        as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.
        define var tableNameString  as char   no-undo.
        define var fullFilter       as char   no-undo.
        define var returnString     as char   no-undo.
        define var fullName         as char   no-undo.
        define var fullReturnString as char   no-undo.
        define var temp             as char   no-undo.
        define var dq2Pacient       as handle no-undo.
        
        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName) + " and ttPacient.LastName = " + quoter(filterLastName).
        daPacient:fetchData(hdsPacient, fullFilter).
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        create query dqPacient.
        dqPacient:set-buffers(hdsPacientBuffer).
        dqPacient:query-prepare("for each ttPacient where " + fullFilter).
        dqPacient:query-open(). 

        dqPacient:get-first().
        
        repeat:
            if dqPacient:query-off-end then leave.      
            else 
            do:
                fullName = string(hdsPacientBuffer::FirstName) + " " + string(hdsPacientBuffer::LastName).
                returnString = returnString + fullName + ",".
                dqPacient:get-next() no-error.                    
            end.
        end.

        temp = filterFirstName.
        filterFirstName = filterLastName.
        filterLastName = temp.

        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName) + " and ttPacient.LastName = " + quoter(filterLastName).

        daPacient:fetchData(newHdsPacient,fullFilter).

        hdsPacientBuffer = newHdsPacient:get-buffer-handle("ttPacient").
        create query dq2Pacient.
        dq2Pacient:set-buffers(hdsPacientBuffer).
        dq2Pacient:query-prepare("for each ttPacient where " + fullFilter).
        dq2Pacient:query-open().

        dq2Pacient:get-first().

        repeat:
            if dq2Pacient:query-off-end then leave.
            else
            do:
                fullName = string(hdsPacientBuffer::FirstName) + " " + string(hdsPacientBuffer::LastName).
                returnString = returnString + fullName + ",".
                dq2Pacient:get-next() no-error.
            end.
        end.

        return returnString.
    end method.
   
    method public character returnEmail(input filterFirstName as char, input filterLastName as char):
        define var dqPacient        as handle no-undo.
        define var dq2Pacient       as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.      
        define var tableNameString  as char   no-undo.      
        define var fullFilter       as char   no-undo.

        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName) + "and ttPacient.LastName = " + quoter(filterLastName).
        daPacient:fetchData(hdsPacient, fullFilter).
     
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        create query dqPacient.

        dqPacient:set-buffers(hdsPacientBuffer).
        dqPacient:query-prepare("for each ttPacient where " + fullFilter).
    
        dqPacient:query-open().
        dqPacient:get-first().

        repeat: 
            dqPacient:get-current().
            if dqPacient:query-off-end then leave.  
            return string(hdsPacientBuffer::E-mail).
          
        end. 
    end method.
    
    method public character returnNameByEmail(input filterEmail as char): 
      
        define var dqPacient        as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.
        define var tableNameString  as char   no-undo.
        define var fullFilter       as char   no-undo.
        define var returnString     as char   no-undo.
        define var mailName         as char   no-undo.
        
        fullFilter = "ttPacient.E-Mail = " + quoter(filterEmail).
        daPacient:fetchData(hdsPacient, fullFilter).
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        create query dqPacient.
        dqPacient:set-buffers(hdsPacientBuffer).
        dqPacient:query-prepare("for each ttPacient where " + fullFilter).
        dqPacient:query-open(). 

        dqPacient:get-first().
       
        repeat:
            if dqPacient:query-off-end then leave.     
            else 
            do:
                mailName = string(hdsPacientBuffer::FirstName) + " " + string(hdsPacientBuffer::LastName).                     
                return mailName.
            end.
        end.   
    end method.
    
    // TODO
    method public void deletePacient(input firstName as char, input mail as character):
        define variable hdsPacient  as handle                                     no-undo.
        define variable daPacient   as PacientBussiness.DataAccess.daPacient      no-undo.
        define variable bePacient   as PacientBussiness.BussinessEntity.bePacient no-undo.
        define variable qPacient    as handle                                     no-undo.
        define variable dtsHandle   as handle                                     no-undo.
        define variable tableHandle as handle                                     no-undo.
        
        bePacient = new PacientBussiness.BussinessEntity.bePacient().
        daPacient = new PacientBussiness.DataAccess.daPacient().
        
        define query qPacient for Pacient scrolling.
        define data-source srcPacient for query qPacient.
        hdsPAcient = dataset dsPacient:handle.

        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
       
        daPacient:fetchData(hdsPacient).
        temp-table ttPacient:tracking-changes = true.
        .
        tableHandle = hdsPacient:get-buffer-handle("ttPacient").

        create query qPacient.
        qPacient:set-buffers(tableHandle).

        qPacient:query-prepare("for each ttPacient where ttPacient.FirstName = " + quoter(firstName) + " and ttPacient.E-mail = " + quoter(mail)).
        qPacient:query-open() no-error.

        repeat:
            if qPacient:query-off-end then
                leave.
            qPacient:get-next().
            do transaction on error undo, leave:
                delete ttPacient.   
                MESSAGE "Succeeded"
                    VIEW-AS ALERT-BOX.
                leave. 
            end.    
        end.

        define variable hChangeDataSet as handle no-undo.
        hdsPacient = dataset dsPacient:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsPacient).
        hdsPacient:get-buffer-handle("ttPacient").
        buffer ttPacient:attach-data-source(data-source srcPacient:handle).

        for each btPacient no-lock:
            buffer btPacient:save-row-changes().
        end.

        temp-table ttPacient:tracking-changes = false.
        hChangeDataSet:get-changes(hdsPacient,true).

    end method.
    

END CLASS.