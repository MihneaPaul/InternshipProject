 
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

CLASS PacientBussiness.bePacient: 
    
    {dsPacient.i}
    define var hdsPacient as handle                     no-undo.
    define var daPacient  as PacientBussiness.daPacient no-undo.
    
    constructor public bePacient():
        daPacient = new PacientBussiness.daPacient().
    end constructor.
    
    method public character returnName(input filterFirstName as char):
        /*        MESSAGE "Intra aici"  */
        /*            VIEW-AS ALERT-BOX.*/
        define var dqPacient        as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.
        define var tableNameString  as char   no-undo.
        define var fullFilter       as char   no-undo.
        define var returnString     as char   no-undo.
        define var fullName         as char   no-undo.
        
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
        return returnString.
    end method.
    
    method public character returnName(input filterFirstName as char, input filterLastName as char): 
      
        define var dqPacient        as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.
        define var tableNameString  as char   no-undo.
        define var fullFilter       as char   no-undo.
        define var returnString     as char   no-undo.
        define var fullName         as char   no-undo.
        
        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName) + "and ttPacient.LastName = " + quoter(filterLastName).
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
        return returnString.
    end method.
    
    method public character returnEmail(input filterFirstName as char, input filterLastName as char):
        define var dqPacient        as handle no-undo.
        define var dq2Pacient       as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.      
        define var tableNameString  as char   no-undo.      
        define var fullFilter       as char   no-undo.
     
        
        /*        def    var testString       as char   init "Hello world" no-undo.*/
        /*        tableNameString = tableNameString + "tt" + tableName.*/
        
        /*        MESSAGE string(entry(1,testString," "))*/
        /*            VIEW-AS ALERT-BOX.                 */
        
        fullFilter = "ttPacient.FirstName = " + quoter(filterFirstName) + "and ttPacient.LastName = " + quoter(filterLastName).
        daPacient:fetchData(hdsPacient, fullFilter).
        /*        daPacient:fetchData(hdsPacient, fullFilter2).*/        
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        create query dqPacient.
        /*        create query dq2Pacient.*/
        dqPacient:set-buffers(hdsPacientBuffer).
        /*        dq2Pacient:Set-buffers(hdsPacientBuffer).*/

        dqPacient:query-prepare("for each ttPacient where " + fullFilter).
        /*        dq2Pacient:query-prepare("for each ttPacient where ttPacient.LastName = " + string(entry(2,filterName," "))).*/
        dqPacient:query-open().
        /*        dq2Pacient:query-open().*/
        
        /*        MESSAGE 3         */
        /*        VIEW-AS ALERT-BOX.*/
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
    method public void deletePacient(input firstName as char, input lastName as char, input mail as character):
        define variable hdsPacient as handle                     no-undo.
        define variable daPacient  as PacientBussiness.daPacient no-undo.
        define variable bePacient  as PacientBussiness.bePacient no-undo.
        define variable qPacient   as handle                     no-undo.
        define variable dtsHandle  as handle                     no-undo.
        define variable tableHandle as handle no-undo.
        
        bePacient = new PacientBussiness.bePacient().
        daPacient = new PacientBussiness.daPacient().
        
        define query qPacient for Pacient scrolling.
        define data-source srcPacient for query qPacient.
        hdsPAcient = dataset dsPacient:handle.
        MESSAGE 1
        VIEW-AS ALERT-BOX.
        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
       
        daPacient:fetchData(hdsPacient).
        temp-table ttPacient:tracking-changes = true.
        MESSAGE 2
        VIEW-AS ALERT-BOX.
        tableHandle = hdsPacient:get-buffer-handle("ttPacient").
        
/*        find first ttPacient where ttPacient.FirstName = firstName and ttPacient.LastName = lastName and*/
/*            ttPacient.E-mail = mail.                                                                    */
   
        MESSAGE 3
        VIEW-AS ALERT-BOX.
        create query qPacient.
        qPacient:set-buffers(tableHandle).
        /*        MESSAGE "trif was here " filter*/
        /*        VIEW-AS ALERT-BOX.             */
        qPacient:query-prepare("for each ttPacient where ttPacient.FirstName = " + firstName + " and ttPacient.LastName = " + lastName + " and ttPacient.E-mail = " + mail).
        MESSAGE 4
        VIEW-AS ALERT-BOX.
        qPacient:query-open() no-error.
        MESSAGE 5
        VIEW-AS ALERT-BOX.
        qPacient:get-first().
        MESSAGE 6
        VIEW-AS ALERT-BOX.
        repeat:
            qPacient:get-next().            
            if qPacient:query-off-end then
                leave.
        end.   
        if available ttPacient then
        do transaction on error undo, leave:
            delete ttPacient.
            MESSAGE "Succeeded"
                VIEW-AS ALERT-BOX.
        end.
        MESSAGE 7
        VIEW-AS ALERT-BOX.
        define variable hChangeDataSet as handle no-undo.
        hdsPacient = dataset dsPacient:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsPacient).
        hdsPacient:get-buffer-handle("ttPacient").
        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
        MESSAGE 8
        VIEW-AS ALERT-BOX.
        for each btPacient no-lock:
            buffer btPacient:save-row-changes().
        end.
            MESSAGE 9
            VIEW-AS ALERT-BOX.
        temp-table ttPacient:tracking-changes = false.
        hChangeDataSet:get-changes(hdsPacient,true).
        MESSAGE 10
        VIEW-AS ALERT-BOX.
    end method.
    

END CLASS.