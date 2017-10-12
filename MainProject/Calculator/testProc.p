
/*------------------------------------------------------------------------
    File        : testProc.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Oct 12 14:27:12 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define var testString as char    no-undo init "3324+5".
define var operators  as char    no-undo init "+-*/".
define var iChar      as integer no-undo.
define var iAsc       as integer no-undo.
define var cTemp      as char    no-undo.
     
define var cChar      as char    no-undo.
/*                                */
/*MESSAGE entry(2,testString, "*")*/
/*    VIEW-AS ALERT-BOX.          */
    
do iChar = 1 to length(testString):
    assign 
        cChar = substring(testString,iChar,1)
        iAsc  = asc(cChar).

    if iAsc = 42 or
        iAsc = 47 or iAsc = 45 or iAsc = 43 then
        cTemp = cTemp + "" + cChar.
end.
MESSAGE cTemp
    VIEW-AS ALERT-BOX.
    
    case cTemp:
        when "*" then
        MESSAGE "1"
        VIEW-AS ALERT-BOX.
        when "+" then
        MESSAGE "2"
        VIEW-AS ALERT-BOX.
        end case.