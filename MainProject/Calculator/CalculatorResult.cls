 
/*------------------------------------------------------------------------
   File        : CalculatorResult
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Thu Oct 12 13:44:05 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Calculator.CalculatorResult: 
    
    define var finalOperation as char      no-undo.
    define var iChar          as integer   no-undo.
    define var iAsc           as integer   no-undo.
    define var cChar          as character no-undo.
    define var cTemp          as character no-undo.
    define var leftOp         as integer   no-undo.
    define var rightOp        as integer   no-undo.
    define var finalResult    as integer   no-undo.
    def  var stringFinal       as char no-undo.
    constructor CalculatorResult(input finalString as char):
        finalOperation = finalString.
        calculate(finalOperation).
    end constructor.
        
    method private int calculate(input finalOp as character):
        do iChar = 1 to length(finalOperation):
            assign 
                cChar = substring(finalOperation,iChar,1)
                iAsc  = asc(cChar).

            if iAsc = 42 or iAsc = 47 or iAsc = 45 or iAsc = 43 then
                cTemp = cTemp + "" + cChar.
        /*            MESSAGE cTemp         */
        /*                VIEW-AS ALERT-BOX.*/
        end.
        
        assign 
            leftOp  = integer(entry(1,finalOperation,string(cTemp)))
            rightOp = integer(entry(2,finalOperation,string(cTemp))).
            
        case cTemp:
            when "+" then
                finalResult = leftOp + rightOp.
            when "-" then
                finalResult = leftOp - rightOp.
            when "*" then
                finalResult = leftOp * rightOp.
            when "/" then
                finalResult = leftOp / rightOp.
        end case.
        
        stringFinal = string(leftOp) + " " + cTemp + " " + string(rightOp) + " = " + string(finalResult).
        
        MESSAGE stringFinal
        VIEW-AS ALERT-BOX. 
    end method.
    

END CLASS.