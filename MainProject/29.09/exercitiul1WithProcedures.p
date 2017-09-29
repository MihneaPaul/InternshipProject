
/*------------------------------------------------------------------------
    File        : exercitiul1WithProcedures.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 14:38:05 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// Strada si numarul  fiecarui client  din statele care incep cu N 
// (folosind 2 functii pentru citirea strazii si citirea numarului)

procedure displayStreetNumber:
    define input parameter stateInitial as character no-undo.
    /*    define output parameter streetNumber as character no-undo.*/
    
    for each Customer where Customer.State begins stateInitial no-lock:
        def var address  as char init "" no-undo.
        def var i        as int  no-undo.           
        def var sentence as char no-undo.
        address = entry(1,string(Customer.Address)," ").
        /*        display address.*/
        do i = 1 to length(address):
            def var tempInt as int no-undo.
            assign 
                tempInt = int(substring(address,i,1)) no-error.
            if tempInt < 10 then
                assign sentence = sentence + "" + string(tempInt) 
                    tempInt  = 0.
            if index(sentence,"0000") <> 0 then
                assign sentence = string(Customer.Address).      
        end.
        display 
        Customer.Name format "x(5)" label "Name"
            Customer.State format "x(5)" label "State" 
            sentence label "Street No." format "x(15)"
            Customer.Address.
        sentence = "".
    end.

end procedure.

run displayStreetNumber(input "N").

/*define variable cAddress like Customer.Address no-undo.                */
/*function findAddressStreet returns char (input letter as char) forward.*/
/*                                                                       */
/*findAddressStreet("N").                                                */
/*                                                                       */
/*function findAddressStreet returns char (input letter as char):        */
/*    for each Customer where Customer.State begins letter no-lock:      */
/*        display Customer.Name format "x(15)" label "Name"              */
/*            Customer.State format "x(5)" label "State"                 */
/*            Customer.Address format "x(20)" label "Address".           */
/*    /*        assign cAddress = cAddress + string(Customer.Address).*/ */
/*    /*        return cAddress.                                      */ */
/*    end.                                                               */
/*end function.  
                                                        */

/*def var testString as char init "223H2 e2g 2lo" no-undo.  */
/*def var i          as int  no-undo.                       */
/*def var sentence   as char no-undo.                       */
/*do i = 1 to length(testString):                           */
/*    def var tempInt as int no-undo.                       */
/*    assign                                                */
/*        tempInt = int(substring(testString,i,1)) no-error.*/
/*    if tempInt <> 0 then                                  */
/*        assign sentence = sentence + "" + string(tempInt).*/
/*    tempInt = 0.                                          */
/*end.                                                      */
/*MESSAGE sentence                                          */
/*    VIEW-AS ALERT-BOX.                                    */