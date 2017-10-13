 
/*------------------------------------------------------------------------
   File        : beEmployee
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Fri Oct 13 12:33:48 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS ExercitiuMeeting.beEmployee: 
    {dsEmployee.i}.
    /*    {ttEmployee.i}.*/
    def var dataAccessEmployee as ExercitiuMeeting.daEmployee no-undo.
    
    constructor public beEmployee():
        dataAccessEmployee = new ExercitiuMeeting.daEmployee().
    end constructor.
    
    method public void addEmployee(input empId as integer, input firstN as character, input lastN as character):
        temp-table ttEmployee:tracking-changes = true.
        
        define query qEmployee for Employee scrolling.
        define data-source srcEmployee for query qEmployee.
        buffer ttEmployee:attach-data-source(data-source srcEmployee:handle,?,?).
        query qEmployee:query-prepare("for each Employee").
        
        create ttEmployee.
        assign
            ttEmployee.EmpNum    = empId
            ttEmployee.FirstName = firstN
            ttEmployee.LastName  = lastN.      
            
        define variable hChangeDataSet as handle no-undo.
        define variable hdsEmployee    as handle no-undo.
        hdsEmployee = dataset dsEmployee:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsEmployee).
        
        for each btEmployee no-lock:
            buffer btEmployee:save-row-changes().
        end.
        temp-table ttEmployee:tracking-changes = false.    
        hChangeDataSet:get-changes(hdsEmployee).                    
    end method. 
      
    method public void updateLastName(input empId as integer, input newLastName as character):
        temp-table ttEmployee:tracking-changes = true.
        
        define query qEmployee for Employee scrolling.
        define data-source srcEmployee for query qEmployee.
        buffer ttEmployee:attach-data-source(data-source srcEmployee:handle,?,?).
        query qEmployee:query-prepare("for each Employee where EmpNum = " + quoter(empId)).
        
        if available ttEmployee then 
        do:
            assign 
                ttEmployee.LastName = newLastName.
        end.    
        
        define variable hChangeDataSet as handle no-undo.
        define variable hdsEmployee    as handle no-undo.
        hdsEmployee = dataset dsEmployee:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsEmployee).
            
        for each btEmployee no-lock:
            buffer btEmployee:save-row-changes().
        end.
        
        temp-table ttEmployee:tracking-changes = false.
        hChangeDataSet:get-changes(hdsEmployee).
    end method.
    
    method public void deleteEmployee(input empId as integer):
        temp-table ttEmployee:tracking-changes = true.
        
        define query qEmployee for Employee scrolling.
        define data-source srcEmployee for query qEmployee.
        buffer ttEmployee:attach-data-source(data-source srcEmployee:handle,?,?).
        query qEmployee:query-prepare("for each Employee where EmpNum = " + quoter(empId)).
        query qEmployee:query-open().
        if available ttEmployee then 
        do:
            delete ttEmployee.
        end.
        
        define variable hChangeDataSet as handle no-undo.
        define variable hdsEmployee    as handle no-undo.
        hdsEmployee = dataset dsEmployee:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsEmployee).
        
        for each btEmployee no-lock:
            buffer btEmployee:save-row-changes().
        end.
            
        temp-table ttEmployee:tracking-changes = false.
        hChangeDataSet:get-changes(hdsEmployee).
        
    end method.
    method public void displayEmployeeById(input id as character):               
        define var hdsEmployee as handle    no-undo.
        define var filter      as character no-undo.
            
        filter = ".EmpNum = " + quoter(id).
        hdsEmployee = dataset dsEmployee:handle.
        
        dataAccessEmployee:fetchData(input-output hdsEmployee, filter).
    end method.
    
END CLASS.