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
define input parameter useEmail as character no-undo.
/* Local Variable Definitions ---                                       */
{dsPacient.i}

define variable fullName  as character                                  no-undo.
define variable bePacient as PacientBussiness.BussinessEntity.bePacient no-undo.
define variable firstName as character                                  no-undo.
define variable lastName  as character                                  no-undo.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Window
&Scoped-define DB-AWARE no

/* Name of first Frame and/or Browse and/or first Query                 */
&Scoped-define FRAME-NAME DEFAULT-FRAME

/* Standard List Definitions                                            */
&Scoped-Define ENABLED-OBJECTS IMAGE-3 fillFirstName fillLastName fillEmail ~
btnSubmit fillPhone fillBirth 
&Scoped-Define DISPLAYED-OBJECTS fillFirstName fillLastName fillEmail ~
fillPhone fillBirth 

/* Custom List Definitions                                              */
/* List-1,List-2,List-3,List-4,List-5,List-6                            */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* ***********************  Control Definitions  ********************** */

/* Define the widget handle for the window                              */
DEFINE VAR C-Win AS WIDGET-HANDLE NO-UNDO.

/* Definitions of the field level widgets                               */
DEFINE BUTTON btnSubmit 
     LABEL "Submit" 
     SIZE 20 BY 2.38
     FONT 11.

DEFINE VARIABLE fillBirth AS DATE FORMAT "99/99/9999":U 
     LABEL "Date of Birth" 
     VIEW-AS FILL-IN 
     SIZE 26 BY 1.48 NO-UNDO.

DEFINE VARIABLE fillEmail AS CHARACTER FORMAT "X(256)":U 
     LABEL "E-mail" 
     VIEW-AS FILL-IN 
     SIZE 26 BY 1.48 NO-UNDO.

DEFINE VARIABLE fillFirstName AS CHARACTER FORMAT "X(256)":U 
     LABEL "First Name" 
     VIEW-AS FILL-IN 
     SIZE 26 BY 1.43 NO-UNDO.

DEFINE VARIABLE fillLastName AS CHARACTER FORMAT "X(256)":U 
     LABEL "Last Name" 
     VIEW-AS FILL-IN 
     SIZE 26 BY 1.48 NO-UNDO.

DEFINE VARIABLE fillPhone AS CHARACTER FORMAT "X(256)":U 
     LABEL "Phone" 
     VIEW-AS FILL-IN 
     SIZE 26 BY 1.48 NO-UNDO.

DEFINE IMAGE IMAGE-3
     FILENAME "C:/Users/Demo/Downloads/latest-updates.jpg":U
     STRETCH-TO-FIT
     SIZE 21 BY 4.76.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME DEFAULT-FRAME
     fillFirstName AT ROW 2.67 COL 16 COLON-ALIGNED WIDGET-ID 2
     fillLastName AT ROW 4.81 COL 16 COLON-ALIGNED WIDGET-ID 4
     fillEmail AT ROW 6.95 COL 16 COLON-ALIGNED WIDGET-ID 6
     btnSubmit AT ROW 7.43 COL 55 WIDGET-ID 12
     fillPhone AT ROW 9.1 COL 16 COLON-ALIGNED WIDGET-ID 8
     fillBirth AT ROW 11.24 COL 16 COLON-ALIGNED WIDGET-ID 10
     IMAGE-3 AT ROW 2.43 COL 54 WIDGET-ID 14
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1
         SIZE 80 BY 16
         BGCOLOR 15 FONT 10 WIDGET-ID 100.


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
         TITLE              = "Update"
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
                                                                        */
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

bePacient = new PacientBussiness.BussinessEntity.bePacient().
fullName = bePacient:returnNameByEmail(useEmail).

           
on choose of btnSubmit 
    do:
        define variable hdsPacient as handle                                     no-undo.
        define variable daPacient  as PacientBussiness.DataAccess.daPacient      no-undo.
        define variable bePacient  as PacientBussiness.BussinessEntity.bePacient no-undo.
        define variable qPacient   as handle                                     no-undo.
        define variable dtsHandle  as handle                                     no-undo.
        
        bePacient = new PacientBussiness.BussinessEntity.bePacient().
        daPacient = new PacientBussiness.DataAccess.daPacient().
        
        define query qPacient for Pacient scrolling.
        define data-source srcPacient for query qPacient.
        /*        dtsHandle = data-source srcPacient:handle.*/
        /*        dtsHandle:add-source-buffer("ttPacient","PacNum").*/
        hdsPAcient = dataset dsPacient:handle.

        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
        /*        daPacient:fetchData(hdsPacient, quoter(firstName), quoter(lastName), quoter(useEmail)).*/

        daPacient:fetchData(hdsPacient).
        temp-table ttPacient:tracking-changes = true.
        temp-table ttPacient:write-json("file","C:\Users\demo\Desktop\mihena.json",yes).
        /*        for each ttPacient:                        */
        /*        /*            MESSAGE ttPacient.FirstName*/*/
        /*        /*                VIEW-AS ALERT-BOX.     */*/
        /*        end.                                       */

//        query qPacient:query-prepare("for each ttPacient where ttPacient.FirstName = " + quoter(firstName)
//            + " and ttPacient.LastName = " + quoter(lastName) + " and ttPacient.E-mail = " + quoter(useEmail)).
        find first ttPacient where ttPacient.FirstName = firstName and ttPacient.LastName = lastName and 
            ttPacient.E-mail = useEmail.
        /*        MESSAGE ttPAcient.LastName "aaaaaaa"*/
        /*            VIEW-AS ALERT-BOX.              */
        /*        find ttPacient where ttPacient.FirstName = firstName and ttPacient.LastName = lastName*/
        /*            and ttPacient.E-mail = useEmail.                                                  */
        if available ttPacient then       
        do transaction on error undo, leave: 

            if(fillFirstName:screen-value <> "") then
            do:
                assign 
                    ttPacient.FirstName = fillFirstName:screen-value.
            end.
                
            if(fillLastName:screen-value <> "") then 
            do:
                assign 
                    ttPacient.LastName = fillLastName:screen-value.
            end.
            if(date(fillBirth:screen-value) <> ?) then 
            do:
                assign 
                    ttPacient.Birth = date(fillBirth:screen-value).
            end.
            if(fillEmail:screen-value <> "") then 
            do:
                assign 
                    ttPacient.E-mail = fillEmail:screen-value.
            end.
            if(fillPhone:screen-value <> "") then 
            do:
                assign 
                    ttPacient.Phone = fillPhone:screen-value.
            end.
            MESSAGE "Succeded"
                VIEW-AS ALERT-BOX. 
            
        end.
        
        
        define variable hChangeDataSet as handle no-undo.
        
        hdsPacient = dataset dsPacient:handle.
        create dataset hChangeDataSet.
        hChangeDataSet:create-like(hdsPacient).
        hdsPacient:get-buffer-handle("ttPacient").
        buffer ttPacient:attach-data-source(data-source srcPacient:handle).
        /*        hdsPacient:get-buffer-handle(1):attach-data-source(data-source srcPacient:HANDLE,"PacNum",?).*/
        for each btPacient no-lock:
            buffer btPacient:save-row-changes().
        end.        
      
        temp-table ttPacient:tracking-changes = false.    
        hChangeDataSet:get-changes(hdsPacient,true).    
       
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
    /*    MESSAGE fullName      */
    /*        VIEW-AS ALERT-BOX.*/
    firstName = entry(1,fullName," ").
    lastName = entry(2,fullName," ").
            
    /*    MESSAGE firstName     */
    /*        VIEW-AS ALERT-BOX.*/
    /*    MESSAGE lastName      */
    /*        VIEW-AS ALERT-BOX.*/
            
    fillFirstName:screen-value = firstName.
    fillLastName:screen-value = lastName.
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
  DISPLAY fillFirstName fillLastName fillEmail fillPhone fillBirth 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  ENABLE IMAGE-3 fillFirstName fillLastName fillEmail btnSubmit fillPhone 
         fillBirth 
      WITH FRAME DEFAULT-FRAME IN WINDOW C-Win.
  {&OPEN-BROWSERS-IN-QUERY-DEFAULT-FRAME}
  VIEW C-Win.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

