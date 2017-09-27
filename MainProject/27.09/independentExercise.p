
/*------------------------------------------------------------------------
    File        : independentExercise.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 04:32:52 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define variable iDayOfDate as integer   no-undo init 0.
define variable cFile      as character no-undo.

etime(yes).

for each Customer no-lock where Customer.State = "NJ":
    if Customer.CustNum > 1000 and Customer.CustNum < 1500 then
    do:
        for each Order of CUstomer no-lock:
            assign 
                iDayOfDate = iDayOfDate + day(Order.OrderDate).
        end.
    end.
end.
etime(no).
            
output to "D:\workspace\Dummy Project Files\testFile1.txt".
put unformatted today skip.
put unformatted exp(iDayOfDate,2) skip.
put unformatted 
    "Total time: " etime skip.
output close.
os-command no-wait "D:\workspace\Dummy Project Files\testFile1.txt".