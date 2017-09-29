
/*------------------------------------------------------------------------
    File        : exercitiul.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 09:36:58 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// Strada si numarul  fiecarui client  din statele care incep cu N 
// (folosind 2 functii pentru citirea strazii si citirea numarului)

define variable cAddress like Customer.Address no-undo.
function findAddressStreet returns char (input letter as char) forward.

findAddressStreet("N").
    
function findAddressStreet returns char (input letter as char):
    for each Customer where Customer.State begins letter no-lock:
        display Customer.Name format "x(15)" label "Name"
            Customer.State format "x(5)" label "State"
            Customer.Address format "x(20)" label "Address".
    /*        assign cAddress = cAddress + string(Customer.Address).*/
    /*        return cAddress.                                      */
    end.   
end function.