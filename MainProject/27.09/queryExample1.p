
/*------------------------------------------------------------------------
    File        : queryExample1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 03:06:35 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

DEFINE QUERY CustQuery FOR Customer.
OPEN QUERY CustQuery PRESELECT EACH Customer WHERE Customer.State = "LA" by Customer.Name.
GET FIRST CustQuery.
DO WHILE NOT QUERY-OFF-END("CustQuery"):
    DISPLAY Customer.CustNum Customer.Name
        NUM-RESULTS("CustQuery") LABEL "Rows"
        WITH FRAME CustFrame 15 DOWN.
    GET NEXT CustQuery.
    DOWN WITH FRAME CustFrame.
END