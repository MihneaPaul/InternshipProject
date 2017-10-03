
/*------------------------------------------------------------------------
    File        : dynamicProDataSetExmaple.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Oct 03 13:15:43 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// exemplu folosit pt invatare - am inteles 25% din el.

define input parameter pcBuffers as char no-undo.
define input parameter pcField as char no-undo.
define input parameter pcSources as char no-undo.
define input parameter pcSourceKeys as char no-undo.
define input parameter pcKeyValue as char no-undo.
define output parameter dataset-handle phDataSet.

define variable hBuffer as handle no-undo.
define variable hDataSource as handle no-undo.
define variable hQuery as handle no-undo.
define variable iEntry as integer no-undo.

create dataset phDataSet.
do iEntry = 1 to num-entries(pcBuffers):
    phDataSet:add-buffer(widget-handle(entry(iEntry,pcBuffers))).
    end.
    
    phDataSet:add-relation(phDataSet:get-buffer-handle(1),
    phDataSet:get-buffer-handle(2),pcField).
    
    do iEntry = 1  to num-entries(pcSources):
        create data-source hDataSource.
        create buffer hBuffer for table entry(iEntry,pcSources).
        hDataSource:add-source-buffer(hBuffer,entry(iEntry,pcSourceKeys)).
        phDataSet:get-buffer-handle(iEntry):attach-data-source(hDataSource).
        
        if iEntry = 1 then do:
            create query hQuery.
            hQuery:add-buffer(hBuffer).
            hQuery:query-prepare("for each " + entry(1,pcSources)+
            " where " + entry(1,pcSourceKeys) + " = " + pcKeyValue).
            hDataSource:query = hQuery.
            end.
           end.
           
           phDataSet:fill().
           delete object hQuery.
           
           do iEntry = 1 to phDataSet:num-buffers:
               hBuffer = phDataSet:get-buffer-handle(iEntry).
               delete object hBuffer:data-source.
               end.