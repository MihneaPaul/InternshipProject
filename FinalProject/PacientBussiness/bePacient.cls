 
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
        
    method public character returnEmail(input filterName as char):
        define var dqPacient        as handle no-undo.
        define var dq2Pacient       as handle no-undo.
        define var hdsPacientBuffer as handle no-undo.      
        define var tableNameString  as char   no-undo.      
        define var fullFilter1      as char   no-undo.
        define var fullFilter2      as char   no-undo.
        
        /*        def    var testString       as char   init "Hello world" no-undo.*/
        /*        tableNameString = tableNameString + "tt" + tableName.*/
        
        /*        MESSAGE string(entry(1,testString," "))*/
        /*            VIEW-AS ALERT-BOX.                 */
        
        fullFilter1 = "ttPacient.FirstName = " + quoter(filterName).
/*        fullFilter2 = "ttpacient.LastName = " + quoter(filterName).*/
        /*        MESSAGE 1         */
        /*        VIEW-AS ALERT-BOX.*/
        /*        MESSAGE fullFilter*/
        /*        VIEW-AS ALERT-BOX.*/
        /*        MESSAGE filterName*/
        /*        VIEW-AS ALERT-BOX.*/
        daPacient:fetchData(hdsPacient, fullFilter1).
/*        daPacient:fetchData(hdsPacient, fullFilter2).*/
        
        hdsPacientBuffer = hdsPacient:get-buffer-handle("ttPacient").
        /*        MESSAGE 2         */
        /*        VIEW-AS ALERT-BOX.*/
        create query dqPacient.
/*        create query dq2Pacient.*/
        dqPacient:set-buffers(hdsPacientBuffer).
/*        dq2Pacient:Set-buffers(hdsPacientBuffer).*/

        dqPacient:query-prepare("for each ttPacient where ttPacient.FirstName = " + filterName).
/*        dq2Pacient:query-prepare("for each ttPacient where ttPacient.LastName = " + string(entry(2,filterName," "))).*/
        dqPacient:query-open().
/*        dq2Pacient:query-open().*/
        
        /*        MESSAGE 3         */
        /*        VIEW-AS ALERT-BOX.*/
        repeat:
            dqPacient:get-next().
/*            dq2Pacient:get-next().*/
            if dqPacient:query-off-end then leave.
/*            if dq2Pacient:query-off-end then leave.*/
            /*            display                      */
            /*                hdsPacientBuffer::E-mail.*/
            return string(hdsPacientBuffer::E-mail).
        end.
        
    end method.

END CLASS.