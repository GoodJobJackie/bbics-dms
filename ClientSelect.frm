VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} ClientSelect 
   Caption         =   "Select a workbook:"
   ClientHeight    =   1575
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   6915
   OleObjectBlob   =   "ClientSelect.frx":0000
   StartUpPosition =   2  'CenterScreen
End
Attribute VB_Name = "ClientSelect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub FileList_Change()

End Sub

Private Sub FileSelect_Click()

    Dim filepath As String
    
    On Error Resume Next

    filepath = ClientSelect.FileList.Value
       
    Set X = Workbooks.Open(filepath)
    
    MsgBox (X.Name)
    X.Activate
    X.Worksheets("Data").Activate
    ActiveWindow.WindowState = xlMaximized
    
    Unload Me
    
    UserAction.version.Caption = version
    
    If X Is Nothing Then
        UserAction.ActionDataEntry.Enabled = True
        UserAction.actionSaveWorkbook.Enabled = False
        UserAction.actionCloseWorkbook.Enabled = False
    Else
        UserAction.ActionDataEntry.Enabled = False
        UserAction.actionSaveWorkbook.Enabled = True
        UserAction.actionCloseWorkbook.Enabled = True
    End If

    DataSelect.Show

End Sub

Private Sub UserForm_Click()

End Sub
