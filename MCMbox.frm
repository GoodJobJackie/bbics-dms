VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} MCMbox 
   Caption         =   "Verify Program/Skill"
   ClientHeight    =   2070
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   4710
   OleObjectBlob   =   "MCMbox.frx":0000
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "MCMbox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub buttonSkip_Click()
    skipFlag = True
    Unload Me
End Sub

Private Sub Label3_Click()
    MCMbox.progMast.Value = True
End Sub

Private Sub Label4_Click()
    MCMbox.progCont.Value = True
End Sub

Private Sub Label5_Click()
    MCMbox.progMaint.Value = True
End Sub

Private Sub NextProgram_Click()
    skipFlag = False
    ProgramName = MCMbox.programNameBox.Value
    SkillName = MCMbox.skillNameBox.Value
    If progMast = True Then
        mCm = "Mastered"
    End If
    If progCont = True Then
        mCm = "Continued"
    End If
    If progMaint = True Then
        mCm = "Maintenance"
    End If
    Unload Me
End Sub

Private Sub UserForm_Activate()
    With MCMbox
        .Top = Application.Top + 95
        .Left = Application.Left + 450
    End With
End Sub

Public Sub UserForm_Initialize()
    MCMbox.programNameBox.Value = ProgramName
    MCMbox.skillNameBox.Value = SkillName
    MCMbox.programNameBox.SetFocus
End Sub