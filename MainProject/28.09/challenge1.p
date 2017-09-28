
/*------------------------------------------------------------------------
    File        : challenge1.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Wed Sep 27 23:44:37 PDT 2017
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

DEF VAR c AS CHARACTER NO-UNDO.
ASSIGN c = "SanLorenzo - SanFrancisco".
DEF VAR cField1 AS CHAR NO-UNDO.
DEF VAR cField2 AS CHAR NO-UNDO.
DEF VAR newSentence AS CHAR NO-UNDO.


ASSIGN newSentence = REPLACE(c," - ", "@").

cField1 = ENTRY(1,newSentence,"@").
cField2 = ENTRY(2,newSentence,"@").

               
MESSAGE "cField 1: " cField1 SKIP
        "cField 2: " cField2
VIEW-AS ALERT-BOX.