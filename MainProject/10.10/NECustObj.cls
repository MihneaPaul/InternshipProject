 
/*------------------------------------------------------------------------
   File        : NECustObj
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Tue Oct 10 09:59:35 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS NECustObj INHERITS CustObj: 

    method private void DisplayCust():
        iNumCusts = iNumCusts + 1.
        for each ttCustomer:
            display ttCustomer.
        end.
    end method.
END CLASS.