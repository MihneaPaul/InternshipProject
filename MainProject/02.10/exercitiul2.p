
/*------------------------------------------------------------------------
    File        : exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Oct 02 16:09:15 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

    // Creati o functie care sa primeasca un input string ca si input parameter 
    // și sa intoarca numarul vocalelor din acel string
  
/*MESSAGE index("Heeelooouu","e")*/
/*    VIEW-AS ALERT-BOX.*/
define variable countVowels as integer no-undo. 
define variable vowels      as character init "aeiou" no-undo.
function vowelCount returns int (input stringInput as character):
    /*        define variable vowels      as character extent 5 init ["a","e","i","o","u"].*/

    define variable i        as integer   no-undo. 
    define variable tempChar as character no-undo.
    do i = 1 to length(stringInput):
        assign
            tempChar = substring(stringInput,i,1).
        if index(vowels,tempChar,1) <> 0 then 
            assign countVowels = countVowels + 1.
               end.
    return countVowels.
end function.

MESSAGE vowelCount("aaaaaaree")
    VIEW-AS ALERT-BOX.
    
/*def var j as int no-undo. */
/*do j = 1 to 4:            */
/*    MESSAGE "Hello"       */
/*        VIEW-AS ALERT-BOX.*/
/*end.                      */


/*MESSAGE length("Hell")*/
/*VIEW-AS ALERT-BOX.    */