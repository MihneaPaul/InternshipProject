
/*------------------------------------------------------------------------
    File        : tempTabelExample.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 10:12:30 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
define temp-table ttInvoice
    field iCustNum   like Invoice.CustNum label "Cust#" format "zz9"
    field cCustName  like Customer.Name format "x(20)"
    field iNumInvs   as integer label "# Inv's" format "z9"
    field dInvTotal  as decimal label "Inv Total   " format ">>,>>9.99"
    field dMaxAmount as decimal label "Max Amount   " format ">>,>>9.99"
    field iInvNum    like Invoice.InvoiceNum label "Inv#" format "zz9"
    index idxCustNum is primary iCustNum
    index idxInvTotal           dInvTotal.
    
for each Invoice, Customer of Invoice:
    find first ttInvoice where ttInvoice.iCustNum = Invoice.CustNum no-error.
    if not available ttInvoice then 
    do:
        create ttInvoice.
        assign
            ttInvoice.iCustNum  = Invoice.CustNum
            ttInvoice.cCustName = Customer.Name.
        if Invoice.Amount > dMaxAmount then
            assign dMaxAmount = Invoice.Amount
                iInvNum    = Invoice.InvoiceNum. 
        assign 
            ttInvoice.dInvTotal = ttInvoice.dInvTotal + Invoice.Amount
            ttInvoice.iNumInvs  = ttInvoice.iNumInvs + 1.      
    end.
end.

for each ttInvoice by dInvTotal descending:
    display iCustNum cCustName iNumInvs dInvTotal iInvNum dMaxAmount.
end.
    
    