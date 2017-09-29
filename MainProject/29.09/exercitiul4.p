
/*------------------------------------------------------------------------
    File        : exercitiul4.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Sep 29 12:52:32 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// 4. Orasul din care s-au dat cele mai  multe comenzi.

// RULATI CODUL PE ABL DOJO (https://abldojo.services.progress.com) -> Raspuns corect: Burlington, 
// PENTRU CA S-AU FACUT SCHIMBARI LA DATA DE BAZE

procedure findCityMostOrders:
    define output parameter city as char no-undo.

    define variable iCount as integer   no-undo.
    define variable iMax   as integer   no-undo init 0.
    define variable cCity  as character no-undo.
    for each Customer no-lock break by Customer.City:
   
        assign 
            iCount = 0.
        for each Order of Customer no-lock:
            iCount = iCount + 1.
            if iMax < iCount then
                assign iMax  = iCount
                    cCity = Customer.City.
        end.
    end.
    assign 
        city = 'Most orders come from ' + cCity.
end procedure.

def var city as char no-undo.
run findCityMostOrders(output city).
MESSAGE city
    VIEW-AS ALERT-BOX.
