VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} DataSelect 
   Caption         =   "Select Data"
   ClientHeight    =   3135
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   2325
   OleObjectBlob   =   "DataSelect.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "DataSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CommandButton1_Click()

    Unload Me
    X.Activate
    X.Worksheets("Data").Activate
    DataEntryPrograms

End Sub

Private Sub CommandButton2_Click()

    X.Worksheets("Bx Data").Activate
    Unload Me

End Sub

Private Sub CommandButton3_Click()

    X.Worksheets("Tutor Hr Data").Activate
    Unload Me

End Sub

Private Sub DataSelectDone_Click()

    Dim FileName As String

    Unload Me
    
    UserAction.Show

End Sub

Private Sub Label2_Click()

End Sub

Private Sub UserForm_Click()

End Sub
