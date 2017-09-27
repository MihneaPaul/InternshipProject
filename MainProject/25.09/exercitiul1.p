
/*------------------------------------------------------------------------
    File        : custom.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Sep 25 03:47:53 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

/* Exercitiul 1: Afisati numele tuturor clientilor (Customer) cu comenzi(Order) date in ultima zi a lunii,
 precum si data comenzii si ziua din saptamana in care a fost data comanda. */
 
DEFINE VARIABLE dateOfOrder AS DATE      NO-UNDO.
DEFINE VARIABLE cDayOfWeek  AS CHARACTER NO-UNDO INIT "Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday".
                
FOR EACH Customer NO-LOCK:        
    FOR EACH Order OF Customer:         
        ASSIGN    
            dateOfOrder = ADD-INTERVAL(Order.OrderDate,1,"days").
        IF MONTH(dateOfOrder) <> MONTH(Order.OrderDate) THEN
            DISPLAY 
                Customer.Name LABEL "Name"
                Order.OrderDate LABEL "Order Date"
                ENTRY(WEEKDAY(Order.OrderDate),cDayOfWeek) LABEL "WeekDay of Order" with frame a width 40.
                
      
    
    END.
END.