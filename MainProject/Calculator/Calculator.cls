 
/*------------------------------------------------------------------------
   File        : Calculator
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Thu Oct 12 13:39:07 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Calculator.Calculator: 
    define variable cInput as Calculator.CalculatorInput no-undo.
    define variable iLeft  as integer                    no-undo.
    define variable iRight as integer                    no-undo.
    define variable op     as character                  no-undo.
    
    constructor public Calculator():
/*        cInput = new Calculator.CalculatorInput().*/
    end constructor.

    /*------------------------------------------------------------------------------
     Purpose: Mathematical calculation
     Notes: Input - CalculatorInput, Returns CalculatorResult
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC Calculator.CalculatorResult execute(input cInput as Calculator.CalculatorInput):
        
        RETURN new Calculator.CalculatorResult(cInput:finalString).

    END METHOD.    
   

END CLASS.