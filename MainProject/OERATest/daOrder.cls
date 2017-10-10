 
 /*------------------------------------------------------------------------
    File        : daOrder
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : demo
    Created     : Tue Oct 10 14:26:47 EEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS OERATest.daOrder: 
    {dsOrder2.i}
    
    method public void fetchData(input-output hdsOrder as handle):
        define data-source srcOrder for Order.
        buffer ttOrder:attach-data-source(data-source srcOrder:handle).
        dataset dsOrder:fill().
        buffer ttOrder:detach-data-source().
        hdsOrder = dataset dsOrder:handle.
        end method.
END CLASS.