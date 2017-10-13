
/*------------------------------------------------------------------------
    File        : Main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Fri Oct 13 12:48:54 EEST 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

def var obj as ExercitiuMeeting.beEmployee.
obj = new ExercitiuMeeting.beEmployee().
/*obj:addEmployee(999, "Dan", "Trif").*/
/*obj:addEmployee(1000,"Adrian","Brad").*/
obj:displayEmployeeById("1000").
/*obj:updateLastName(999,"Trifuletz").*/
obj:deleteEmployee(1000).