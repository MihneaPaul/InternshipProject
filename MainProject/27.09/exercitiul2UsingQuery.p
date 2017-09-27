
/*------------------------------------------------------------------------
    File        : queryExample1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 02:24:03 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* 2. Afisati numele tuturor angajatilor (Employee) care locuiesc pe strada "Springs Rd". */

define query CustQuery for Employee.
open query CustQuery for each Employee where index(Address,"Springs Rd") > 0.
get first CustQuery.
do while not query-off-end("CustQuery"):
    display num-results("CustQuery") label "Number of records found".
    display Employee.FirstName format "x(5)" label "First name"
        Employee.LastName format "x(5)" label "Last name"
        Employee.Address label "address"
        with frame CustFrame 15 down.
    get next CustQuery.
    down with frame CustFrame.
    
end.








