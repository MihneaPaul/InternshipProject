
/*------------------------------------------------------------------------
    File        : readJSON&XML.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Oct 05 13:10:37 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define input parameter path as character.

define variable hdsCustomer as handle no-undo.
define variable hdsCustomerBuffer as handle no-undo.
define variable qCust as handle.

create dataset hdsCustomer.

hdsCustomer:read-json("D:\workspace\MainProject\05.10\XML&JSON\Files\jsonTest.json","empy").
hdsCustomerBuffer = hdsCUstomer:get-buffer-handle("ttCustomer").

create query qCust.
qCust:set-buffers(hdsCustomerBuffer).
qCust:query-prepare("for each ttCustomer").
qCust:query-open.

repeat:
    qCust:get-next().
    if qCust:query-off-end then
        leave.
    display hdsCustomerBuffer::custNum
        hdsCustomerBuffer::name
        with frame B title "XML" 20 col down.
end.
    
qCust:query-close().
delete object qCust.