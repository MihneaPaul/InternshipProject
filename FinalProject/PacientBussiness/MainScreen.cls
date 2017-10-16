 
 /*------------------------------------------------------------------------
    File        : MainScreen
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : demo
    Created     : Mon Oct 16 14:16:40 EEST 2017
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Progress.Windows.Form.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS MainScreen INHERITS Form: 
    
    DEFINE PRIVATE VARIABLE button1 AS System.Windows.Forms.Button NO-UNDO.
    DEFINE PRIVATE VARIABLE components AS System.ComponentModel.IContainer NO-UNDO.

        
    CONSTRUCTOR PUBLIC MainScreen (  ):
        
        
        SUPER().
        InitializeComponent().
        THIS-OBJECT:ComponentsCollection:ADD(THIS-OBJECT:components).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.

    END CONSTRUCTOR.

	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
	@VisualDesigner.
	METHOD PRIVATE VOID button1_Click( INPUT sender AS System.Object, INPUT e AS System.EventArgs ):
	disp "asdf".	
		RETURN.

	END METHOD.

    METHOD PRIVATE VOID InitializeComponent(  ):
        
        /* NOTE: The following method is automatically generated.
        
        We strongly suggest that the contents of this method only be modified using the
        Visual Designer to avoid any incompatible modifications.
        
        Modifying the contents of this method using a code editor will invalidate any support for this file. */
        THIS-OBJECT:button1 = NEW System.Windows.Forms.Button().
        THIS-OBJECT:SuspendLayout().
        /*  */
        /* button1 */
        /*  */
        THIS-OBJECT:button1:Location = NEW System.Drawing.Point(183, 109).
        THIS-OBJECT:button1:Name = "button1".
        THIS-OBJECT:button1:Size = NEW System.Drawing.Size(75, 23).
        THIS-OBJECT:button1:TabIndex = 0.
        THIS-OBJECT:button1:Text = "button1".
        THIS-OBJECT:button1:UseCompatibleTextRendering = true.
        THIS-OBJECT:button1:UseVisualStyleBackColor = true.
        THIS-OBJECT:button1:Click:Subscribe(THIS-OBJECT:button1_Click).
        /*  */
        /* MainScreen */
        /*  */
        THIS-OBJECT:ClientSize = NEW System.Drawing.Size(292, 266).
        THIS-OBJECT:Controls:Add(THIS-OBJECT:button1).
        THIS-OBJECT:Name = "MainScreen".
        THIS-OBJECT:Text = "MainScreen".
        THIS-OBJECT:ResumeLayout(false).
        CATCH e AS Progress.Lang.Error:
            UNDO, THROW e.
        END CATCH.
    END METHOD.

    DESTRUCTOR PUBLIC MainScreen ( ):

    END DESTRUCTOR.

END CLASS.