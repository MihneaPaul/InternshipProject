 
 /*------------------------------------------------------------------------
    File        : MyMain
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : demo
    Created     : Tue Oct 10 10:19:33 EEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS MyMain: 
    define private variable rNECust as class NECustObj no-undo.
    
    method private void DisplayCust():
        rNECust = new NeCustObj().
        rNECust:iNumCUst = rNECust:iNumCusts + 2.
        end method.

END CLASS.