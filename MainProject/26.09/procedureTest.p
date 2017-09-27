
/*------------------------------------------------------------------------
    File        : procedureTest.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Sep 26 00:53:01 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
define variable iDays as INTEGER   NO-UNDO.
define variable cVar  as character no-undo init "subproc var".

run subproc.
DISPLAY cVar.
procedure subproc:
    define variable cVar as character no-undo.
    ASSIGN 
        cVar = "test1".
    
end procedure.
    
    

PROCEDURE calcDays:
    DEFINE INPUT PARAMETER pdaShip AS DATE NO-UNDO.
    DEFINE OUTPUT PARAMETER piDays AS INTEGER NO-UNDO.
    piDays = IF pdaShip = ? THEN 0 ELSE TODAY - pdaShip.
    DISPLAY iDays label "Days" format "ZZZ9".
end procedure.

/*    MESSAGE 3                                        */
/*    VIEW-AS ALERT-BOX.                               */
/*    RUN calcDays(INPUT Order.ShipDate, OUTPUT iDays).*/
/*    MESSAGE 4                                        */
/*    VIEW-AS ALERT-BOX.                               */
/*                                                     */
for each Customer no-lock:
    for each Order of Customer no-lock:
        RUN calcDays(INPUT Order.ShipDate, OUTPUT iDays).
        
    end.
end.


    

