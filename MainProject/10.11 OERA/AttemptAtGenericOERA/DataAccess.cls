 
/*------------------------------------------------------------------------
   File        : DataAccess
   Purpose     : 
   Syntax      : 
   Description : 
   Author(s)   : demo
   Created     : Wed Oct 11 11:33:04 EEST 2017
   Notes       : 
 ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS GenericOERA.DataAccess ABSTRACT: 
    
    constructor public DataAccess():
        super().
    end constructor.
    
    destructor public DataAccess():
    end destructor.
    
/*    method public void fetchData(input tbHandle as handle, input filter as char, input tbName as char):*/
/*        define var bufferHandle as handle no-undo.                                                     */
/*        define var queryHandle  as handle no-undo.                                                     */
/*                                                                                                       */
/*        bufferHandle = tbHandle:get-buffer-handle(tbName).                                             */
/*                                                                                                       */
/*        create query queryHandle.                                                                      */
/*        queryHandle:set-buffers(bufferHandle).                                                         */
/*        queryHandle:query-prepare("for each " + tbName + " where " + tbName + filter).                 */
/*        queryHandle:query-open() no-error.                                                             */
/*                                                                                                       */
/*        repeat:                                                                                        */
/*            queryHandle:get-next().                                                                    */
/*            if queryHandle:query-off-end then                                                          */
/*                leave.                                                                                 */
/*        end.                                                                                           */
/*    end method.                                                                                        */
    
    method public void fetchData(input tbHandle as handle, input tbName as char):
        define var bufferHandle as handle no-undo.
        define var queryHandle as handle no-undo.
        
        bufferHandle = tbHandle:get-buffer-handle(tbName).
        create query queryHandle.
        queryHandle:set-buffers(bufferHandle).
        define data-source src for queryHandle.
    
    method public abstract void storeData().
        

END CLASS.