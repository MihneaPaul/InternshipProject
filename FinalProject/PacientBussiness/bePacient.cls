 
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
        /*        MESSAGE 2         */
        /*        VIEW-AS ALERT-BOX.*/
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
            if dqPacient:query-off-end then leave.
            else 
            do: 
                dqPacient:get-next().
                return string(hdsPacientBuffer::E-mail).
            end.
        end.
        
    end method.

END CLASS.