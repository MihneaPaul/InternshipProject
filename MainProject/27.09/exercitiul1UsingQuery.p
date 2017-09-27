
/*------------------------------------------------------------------------
    File        : exercitiul1UsingQuery.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 03:11:23 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

define query cqh for Customer, Order.
define query ogh for Order.

define variable dateOfOrder as date      no-undo.
define variable cDayOfWeek  as character no-undo init "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday".

open query cqh for each Customer, each Order of Customer.


get first cqh.

do while not query-off-end("cqh"):
    assign 
        dateOfOrder = add-interval(Order.OrderDate,1,"days").
    if month(dateOfOrder) <> month(Order.OrderDate) then
        display Customer.Name Order.OrderDate 
            entry(weekday(Order.OrderDate),cDayOfWeek) label "Week Day of Order"
            with frame CustFrame 10 down.
    get next cqh.
    down with frame CustFrame.
end.         
