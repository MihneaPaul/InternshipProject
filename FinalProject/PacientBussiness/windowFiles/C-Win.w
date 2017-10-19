&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12 GUI
&ANALYZE-RESUME
&Scoped-define WINDOW-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS C-Win 
/*------------------------------------------------------------------------

  File: 

  Description: 

  Input Parameters:
      <none>

  Output Parameters:
      <none>

  Author: 

  Created: 

------------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */

/* Parameters Definitions ---                                           */
define input parameter chooseOpen as integer no-undo.
/* Local Variable Definitions ---                                       */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS searchFill btnSearch SELECT-1 selectEmail 
&Scoped-Define DISPLAYED-OBJECTS searchFill SELECT-1 selectEmail 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON btnSearch 
    LABEL "Search" 
    SIZE 15 BY 1.14
    FONT 0.

DEFINE VARIABLE searchFill  AS CHARACTER FORMAT "X(256)":U 
    LABEL "Search by Name" 
    VIEW-AS FILL-IN 
    SIZE 30 BY 2.14
    FONT 0 NO-UNDO.

DEFINE VARIABLE SELECT-1    AS CHARACTER 
    VIEW-AS SELECTION-LIST SINGLE SCROLLBAR-VERTICAL 
    SIZE 36 BY 5.95 NO-UNDO.

DEFINE VARIABLE selectEmail AS CHARACTER 
    VIEW-AS SELECTION-LIST SINGLE SCROLLBAR-VERTICAL 
    SIZE 37 BY 2 NO-UNDO.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
    searchFill AT ROW 1.48 COL 25 COLON-ALIGNED WIDGET-ID 8
    btnSearch AT ROW 4.81 COL 34 WIDGET-ID 4
    SELECT-1 AT ROW 6.48 COL 24 NO-LABEL WIDGET-ID 10
    selectEmail AT ROW 14.33 COL 24 NO-LABEL WIDGET-ID 12
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
    SIDE-LABELS NO-UNDERLINE THREE-D 
    AT COL 1 ROW 1
    SIZE 80 BY 16 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Window
   Allow: Basic,Browse,DB-Fields,Window,Query
   Other Settings: COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
IF SESSION:DISPLAY-TYPE = "GUI":U THEN
    CREATE WINDOW C-Win ASSIGN
        HIDDEN             = YES
        TITLE              = "<insert window title>"
        HEIGHT             = 16
        WIDTH              = 80
        MAX-HEIGHT         = 16
        MAX-WIDTH          = 80
        VIRTUAL-HEIGHT     = 16
        VIRTUAL-WIDTH      = 80
        RESIZE             = yes
        SCROLL-BARS        = no
        STATUS-AREA        = no
        BGCOLOR            = ?
        FGCOLOR            = ?
        KEEP-FRAME-Z-ORDER = yes
        THREE-D            = yes
        MESSAGE-AREA       = no
        SENSITIVE          = yes.
ELSE {&WINDOW-NAME} = CURRENT-WINDOW.
/* END WINDOW DEFINITION                                                */
&ANALYZE-RESUME



/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW C-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME DEFAULT-FRAME
   FRAME-NAME                                                           */
IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
    THEN C-Win:HIDDEN = no.

/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME

 



/* ************************  Control Triggers  ************************ */

&Scoped-define SELF-NAME C-Win
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON END-ERROR OF C-Win /* <insert window title> */
    OR ENDKEY OF {&WINDOW-NAME} ANYWHERE 
    DO:
        /* This case occurs when the user presses the "Esc" key.
           In a persistently run window, just ignore this.  If we did not, the
           application would exit. */
        IF THIS-PROCEDURE:PERSISTENT THEN RETURN NO-APPLY.
    END.
    
define variable cListItem        as character                  no-undo.
define variable nameString       as character                  no-undo.
define variable bePacient        as PacientBussiness.bePacient no-undo.
define variable nameFirst        as character                  no-undo.
define variable nameLast         as character                  no-undo.
define variable finalStringValue as character                  no-undo.                             
define variable hasSpaces        as logical                    no-undo.
define variable useFirstName     as character                  no-undo.
define variable useLastName      as character                  no-undo.
define variable useEmail         as character                  no-undo.
    
bePacient = new PacientBussiness.bePacient().

def var numEntries as integer no-undo init 1.

on choose of btnSearch   
    do: 
        def var i as integer no-undo.
        
        SELECT-1:LIST-ITEMS = ''.
        /*    ASSIGN SELECT-1:LIST-ITEMS IN FRAME {&FRAME-NAME} = "".*/
        
        hasSpaces = index(left-trim(right-trim(searchFill:screen-value," ")," ")," ") <> 0.
        if(hasSpaces) then 
        do:
            nameFirst = entry(1,searchFill:screen-value," ").
            nameLast  = entry(2,searchFill:screen-value," ").

            SELECT-1:LIST-ITEMS = bePacient:returnName(string(quoter(nameFirst)), string(quoter(nameLast))). 
            if SELECT-1:num-items = 0 then
            do:
                MESSAGE "No Pacient with this name available."
                    VIEW-AS ALERT-BOX.
            end.
            else
            do:
    
                useFirstName = entry(1,searchFill:SCREEN-VALUE," ").
                useLastName  = entry(2,searchFill:SCREEN-VALUE," ").              
                cListItem = SELECT-1:LIST-ITEMS.
            /*                numEntries = num-items(SELECT-1).*/
            /*                        MESSAGE SELECT-1:num-items*/
            /*            VIEW-AS ALERT-BOX.                    */
            end.
        end.
        else 
        do: 
            SELECT-1:LIST-ITEMS = bePacient:returnName(string(quoter(searchFill:screen-value))).
            if SELECT-1:num-items = 0 then
            do:
                MESSAGE "No Pacient with this name available."
                    VIEW-AS ALERT-BOX.
            end.
            else
            do:
      
                
                useFirstName = entry(1,searchFill:SCREEN-VALUE," ").
                /*            useLastName  = entry(2,searchFill:SCREEN-VALUE," ").*/

                cListItem = SELECT-1:LIST-ITEMS.
            /*                numEntries = num-entries(SELECT-1).*/
            /*                      MESSAGE SELECT-1:num-items*/
            /*            VIEW-AS ALERT-BOX.                  */
            end.
        end.
    /*    define variable comboNames as char no-undo*/
    /*    view-as combo-box list-items SELECT-1.    */
    /*         disp bePacient:returnName(string(searchFill:screen-value)).*/
    
    /*      SELECT-1:SCREEN-VALUE = string(bePacient:returnName(quoter(searchFill:screen-value))).*/
    /*    returnField:screen-value = bePacient:returnEmail(quoter(searchFill:screen-value)).*/
   
    end.
    
def var iValuePosition as integer no-undo.
def var cValue         as char    no-undo.
def var cLabel         as char    no-undo.

on value-changed of SELECT-1 in frame DEFAULT-FRAME 
    do:    
        cListItem = Select-1:list-items.
        /*        MESSAGE "cListItems: " cListItem*/
        /*            VIEW-AS ALERT-BOX.          */
        cValue = SELECT-1:screen-value in frame {&FRAME-NAME}.
        /*        MESSAGE "cValue: " cValue*/
        /*            VIEW-AS ALERT-BOX.   */
        iValuePosition = lookup(cValue, cListItem).
        /*        MESSAGE "iValuePosition: " iValuePosition*/
        /*            VIEW-AS ALERT-BOX.                   */
        /*        iLabelPosition = iValuePosition - 1.    */
        /*        MESSAGE "iLabelPosition " iLabelPosition*/
        /*            VIEW-AS ALERT-BOX.                  */
        cLabel = entry(iValuePosition, cListItem).
        selectEmail:LIST-ITEMS = bePacient:returnEmail(quoter(entry(1,cLabel," ")),quoter(entry(2,cLabel," "))).

    end.
   
    
on value-changed of selectEmail in frame DEFAULT-FRAME
    do:
        useEmail = selectEmail:screen-value.
        if(chooseOpen = 0) then 
            run Update.w(input useEmail).
        else if (chooseOpen = 1)  then 
            do:
                
                // TODO!!
                
                MESSAGE "You have chosen to delete" useFirstName useLastName + "." SKIP(1)
                    "Do you really want to delete this Pacient?"
                    VIEW-AS ALERT-BOX QUESTION BUTTONS YES-NO-CANCEL
                    TITLE "" UPDATE lChoice AS LOGICAL.
                CASE lChoice:
                    WHEN TRUE THEN /* Yes */
                        DO:
                            bePacient:deletePacient(useFirstName, useEmail).
                        END.
                    WHEN FALSE THEN /* No */
                        DO:
                            MESSAGE "Deletion canceled."
                                VIEW-AS ALERT-BOX INFORMATION BUTTONS OK.
                            RETURN NO-APPLY.
                        END.
                    OTHERWISE /* Cancel */
                    STOP.
                END CASE.
            END.
    /*                run Delete.w(input useEmail).*/
    end.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CONTROL C-Win C-Win
ON WINDOW-CLOSE OF C-Win /* <insert window title> */
    DO:
        /* This event will close the window and terminate the procedure.  */
        APPLY "CLOSE":U TO THIS-PROCEDURE.
        RETURN NO-APPLY.
    END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&UNDEFINE SELF-NAME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK C-Win 


/* ***************************  Main Block  *************************** */

/* Set CURRENT-WINDOW: this will parent dialog-boxes and frames.        */
ASSIGN CURRENT-WINDOW                = {&WINDOW-NAME} 
       THIS-PROCEDURE:CURRENT-WINDOW = {&WINDOW-NAME}.

/* The CLOSE event can be used from inside or outside the procedure to  */
/* terminate it.                                                        */
ON CLOSE OF THIS-PROCEDURE 
    RUN disable_UI.

/* Best default for GUI applications is...                              */
PAUSE 0 BEFORE-HIDE.

/* Now enable the interface and wait for the exit condition.            */
/* (NOTE: handle ERROR and END-KEY so cleanup code will always fire.    */
MAIN-BLOCK:
DO ON ERROR   UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK
    ON END-KEY UNDO MAIN-BLOCK, LEAVE MAIN-BLOCK:
    RUN enable_UI.
    IF NOT THIS-PROCEDURE:PERSISTENT THEN
        WAIT-FOR CLOSE OF THIS-PROCEDURE.
END.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI C-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
    /*------------------------------------------------------------------------------
      Purpose:     DISABLE the User Interface
      Parameters:  <none>
      Notes:       Here we clean-up the user-interface by deleting
                   dynamic widgets we have created and/or hide 
                   frames.  This procedure is usually called when
                   we are ready to "clean-up" after running.
    ------------------------------------------------------------------------------*/
    /* Delete the WINDOW we created */
    IF SESSION:DISPLAY-TYPE = "GUI":U AND VALID-HANDLE(C-Win)
        THEN DELETE WIDGET C-Win.
    IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE enable_UI C-Win  _DEFAULT-ENABLE
PROCEDURE enable_UI :
    /*------------------------------------------------------------------------------
      Purpose:     ENABLE the User Interface
      Parameters:  <none>
      Notes:       Here we display/view/enable the widgets in the
                   user-interface.  In addition, OPEN all queries
                   associated with each FRAME and BROWSE.
                   These statements here are based on the "Other 
                   Settings" section of the widget Property Sheets.
    ------------------------------------------------------------------------------*/
    DISPLAY searchFill SELECT-1 selectEmail 
        WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
    ENABLE searchFill btnSearch SELECT-1 selectEmail 
        WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
    {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
    VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

