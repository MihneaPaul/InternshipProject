
/*------------------------------------------------------------------------
    File        : CelsiusToFahr.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 15:29:52 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

function CtoF returns decimal (input dCelsius as decimal):
    return (dCelsius * 1.8) + 32.
end function.