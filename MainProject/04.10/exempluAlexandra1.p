
/*------------------------------------------------------------------------
    File        : exempluAlexandra.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 04 11:28:50 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define temp-table ttCustomer like Customer 
    before-table btCustomer.

define dataset dCustomer for ttCustomer.
define query qCustomer for Customer scrolling.
define data-source dsCustomer for query qCustomer.
buffer ttCustomer:attach-data-source(data-source dsCustomer:handle,?,?).
query qCustomer:query-prepare("for each Customer where Customer.CustNum < 5").
dataset dCustomer:fill().
temp-table ttCustomer:tracking-changes = true.

// add record

create ttCustomer.
assign 
    ttCustomer.CustNum = 99999
    ttCustomer.Name    = "New Name".

// update record

find ttCustomer where ttCustomer.CustNum = 3 no-lock no-error.
assign 
    ttCustomer.Name = "Updated Name".

// delete record

find ttCustomer where ttCustomer.CustNum = 3 no-lock no-error.
delete ttCustomer.

for each ttCustomer no-lock:
    display
        string(buffer ttCustomer:rowid) label "ROWID" format "x(10)"
        ttCustomer.CustNum format ">>>>9"
        ttCustomer.Name format "x(15)"
        buffer ttCustomer:row-state label "ROW-STATE"
        string(buffer ttCUstomer:before-rowid) label "BEFORE-ROWID" format "x(10)"
        with frame a title "DataSet After-Table" 4 down width 90.
end.

define variable i as integer no-undo.

for each btCustomer no-lock:
    assign i = buffer btCustomer:row-state.
    display
    string(buffer btCustomer:rowid) label "ROWID" format "x(10)"
    btCustomer.custNum
    btCustomer.Name format "x(10)"
    buffer btCustomer:row-state label "ROW-STATE"
    i
    string(buffer btCustomer:after-rowid) label "after-rowid" format "x(10)"
    with frame b title "DataSet Before-Table" 4 down.
    end.
    
    define variable hChangeDataSet as handle no-undo.
    define variable hdsCustomer as handle no-undo.
    hdsCustomer = dataset dCustomer:handle.
    create dataset hChangeDataSet.
    hChangeDataSet:create-like(hdsCustomer).
    
    temp-table ttCustomer:tracking-changes = false.
    // add save row changes
    hChangeDataSet:get-changes(hdsCustomer).