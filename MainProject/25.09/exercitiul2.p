
/*------------------------------------------------------------------------
    File        : exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Sep 25 04:52:57 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* Exercitiul 2: 2. Afisati numele tuturor angajatilor (Employee) care locuiesc pe strada "Springs Rd". */

FOR EACH Employee NO-LOCK WHERE INDEX(Address,"Springs Rd") > 0:
    
        DISPLAY Employee.FirstName Employee.LastName Employee.Address.
END.

    