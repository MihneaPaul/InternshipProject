
/*------------------------------------------------------------------------
    File        : exercitiul2.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Thu Sep 28 02:33:16 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
/*Country: Romania                                                     */
/*Name: <numele vostru>                                                */
/*Address: 77, 21 Decembrie 1989 St., The Office                       */
/*City: Cluj-Napoca                                                    */
/*State: CJ                                                            */
/*PostalCode: 400604                                                   */
/*EmailAddress: <numelevostruintreg separat prin puncte>@tss-yonder.com*/

define buffer xcust for Customer.
create Customer.
assign
    Customer.Name         = "Deliu Mihnea-Paul"
    Customer.Country      = "Romania"
    Customer.Address      = "77, 21 Decembrie 1989 St., The Office"
    Customer.City         = "Cluj-Napoca"
    Customer.State        = "CJ"
    Customer.PostalCode   = "400604"
    Customer.EmailAddress = "deliu.mihnea.paul@tss-yonder.com".
validate Customer.

define query CustQuery for Customer.
open query CustQuery for each Customer where Customer.City = "Cluj-Napoca".
get first CustQuery.
do while not query-off-end("CustQuery"):
    display
        Customer.Name format "x(25)" label "Name"
        Customer.Country format "x(25)" label "Country"
        Customer.EmailAddress format "x(25)" label "E-mail"
        with frame CustFrame 15 down.

    get next CustQuery.
    down with frame CustFrame.
end.


