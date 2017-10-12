 
 /*------------------------------------------------------------------------
    File        : CalculatorInput
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : demo
    Created     : Thu Oct 12 13:43:57 EEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Calculator.CalculatorInput:
     
    define public var finalString as char no-undo.
/*    define public var calculatorResult as Calculator.CalculatorResult no-undo.*/
    
    constructor public CalculatorInput(input leftOp as integer, input operator as char, input rightOp as integer):
        finalString = string(leftOp) + "" + operator + "" + string(rightOp).
        new Calculator.CalculatorResult(finalString).
        end constructor.

END CLASS.