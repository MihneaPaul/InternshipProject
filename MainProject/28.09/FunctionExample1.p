
/*------------------------------------------------------------------------
    File        : FunctionExample1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 15:24:32 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

// !!! uses CelsiusToFahr.p

define variable dTemp as decimal no-undo.
define variable hFuncProc as handle no-undo.

function CtoF returns decimal (input dCelsius as decimal) in hFuncProc.

run CelsiusToFahr.p persistent set hFuncProc.

repeat dTemp = 0 to 100:
    display
        dTemp label "Celsius"
        CtOf(dTemp) label "Fahrenheit"
        with frame f 10 down.
end.
    
delete procedure hFuncProc.
