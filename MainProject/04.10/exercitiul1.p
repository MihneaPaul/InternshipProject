
/*------------------------------------------------------------------------
    File        : exercitiul1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Oct 04 08:54:22 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* Creati o functie care citeste toate recordurile dintro tabela la 
si le tipareste intru fisier txt cate un record pe linie, 
creati apoi o a 2 a functie care sa citeasca acest fisier si 
sa creeze in baza de date un record pentru fiecare linie din fisier */
 
/*define variable cAbsolutePath as character no-undo.*/
/*define variable cFileName     as character no-undo.*/

/* output to "D:\workspace\MainProject\04.10\Files\cust.txt".*/
function writeToFile returns character (input cAbsolutePath as character, input cFileName as character):
    define variable finalPath as character no-undo.
    finalPath = cAbsolutePath + "\" + cFileName.
    MESSAGE finalPath
    VIEW-AS ALERT-BOX.
    output to value(finalPath).
        for each Customer where Customer.CustNum < 40 no-lock:
    display Customer.Name skip.
/*    put unformatted Customer.Name skip.*/
end.
output close.
end function.

writeToFile("D:\workspace\MainProject\04.10\Files","custTest1.txt").