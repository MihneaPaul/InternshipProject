
/*------------------------------------------------------------------------
    File        : Main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Oct 12 15:12:34 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable cCalculator as Calculator.Calculator.
define variable inCalculator as Calculator.CalculatorInput.

cCalculator = new Calculator.Calculator().
inCalculator = new Calculator.CalculatorInput(3,"*",5).
cCalculator:execute(inCalculator)

