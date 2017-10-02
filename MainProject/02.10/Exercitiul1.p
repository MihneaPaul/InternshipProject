
/*------------------------------------------------------------------------
    File        : Exercitiul1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 15:59:35 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

    // Creati o functie care sa extraga primele 3 caractere dintrun string primit ca input parameter 
    // si sa intoarca rezultatul ca si ouput
    
function first3Chars returns character (input stringWord as character):
    def var finalString as character no-undo.
    def var i           as integer   no-undo.
    do i = 1 to 3:
        finalString = finalString + "" + substring(stringWord,i,1).  
    end.
    return finalString.
end function.
         
MESSAGE first3Chars("Tr43orhjewof")
VIEW-AS ALERT-BOX.       