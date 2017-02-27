VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} UserAction 
   Caption         =   "Please select an action."
   ClientHeight    =   9345
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   5040
   OleObjectBlob   =   "UserAction.frx":0000
   StartUpPosition =   2  'CenterScreen
End
Attribute VB_Name = "UserAction"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub actionCloseWorkbook_Click()

    'Close current client workbook
    X.Close
    Set X = Nothing
    
        UserAction.ActionDataEntry.Enabled = True
        UserAction.actionSaveWorkbook.Enabled = False
        UserAction.actionCloseWorkbook.Enabled = False

End Sub

Private Sub actionDatabase_Click()

    Dim strFile As String

    'Open BBICS database
    strFile = "C:\Users\jackie\Desktop\BBICS Employee Database.fmp12"

    Shell "cmd /c """ & strFile & """", 0

End Sub

Private Sub ActionDataEntry_Click()

    Set objFSO = CreateObject("Scripting.FileSystemObject")
    Set objFolder = objFSO.GetFolder("C:\Users\jackie\Documents\Client Files\Data\Formatted")
    
    'Populate client file list and open dialog box
    ClientSelect.FileList = "Select File..."
    
    For Each objFile In objFolder.Files
        ClientSelect.FileList.AddItem CStr(objFile)
    Next objFile

    Unload Me
    
    ClientSelect.Show
    
End Sub

Private Sub actionDebug_Click()

    Application.DisplayAlerts = False
    For Each Worksheet In ActiveWorkbook.Worksheets
        Select Case Worksheet.Name
            Case Is = "PD"
                Worksheets("PD").Delete
            Case Is = "CI"
                Worksheets("CI").Delete
            Case Is = "SDL"
                Worksheets("SDL").Delete
            Case Is = "Current"
                Worksheets("Current").Delete
            Case Is = "Programs"
                Worksheets("Programs").Delete
        End Select
    Next
    Application.DisplayAlerts = True

End Sub

Private Sub actionDocuments_Click()

    Dim strFile As String

    'Open administrative documents menu
    strFile = "C:\Users\jackie\Desktop\Admin Documents.jar"

    Shell "cmd /c """ & strFile & """", 0

End Sub

Private Sub ActionImportSP_Click()

    Unload Me
    ImportSkillsPrograms
    
End Sub

Private Sub actionIPG_Click()

    Unload Me
    ImportSkillsPrograms
    PopulatePrograms
    CreateProgramLists
    PopulateReport
    MsgBox ("Report Successfully Generated at: " & Now)

End Sub

Private Sub actionNewClient_Click()

    Dim client As String
    Dim FileName As String
    
    'Create and format a new client workbook
    client = InputBox("Please enter new client initials:", "New Client")
    FileName = "C:\Users\jackie\Documents\Client Files\Data\Formatted\" & UCase(client) & " - 0000_00_00.xlsx"
    
    Workbooks.Add
    ActiveSheet.Name = "Tutor Hr Data"
    Worksheets.Add().Name = "Bx Data"
    Worksheets.Add().Name = "Data"
    
    Worksheets("Data").Activate
    CreateHeader
    MasterListFormat
    Worksheets("Data").Cells(1, 1) = UCase(client)
    Worksheets("Data").Cells(4, 1) = DateValue("01/01/2016")
    Worksheets("Data").Cells(5, 1) = Format(Now, "mm/dd/yyyy")
    Cells(4, 2).Select
    ActiveWindow.FreezePanes = False
    ActiveWindow.FreezePanes = True
    ActiveWindow.Zoom = 90
    Worksheets("Data").Rows(2).Select
    With Selection
        .Font.Bold = True
    End With
    
    Worksheets("Bx Data").Activate
    Cells.Select
    Range("BQ21").Activate
    Selection.ColumnWidth = 11
    Range("A1:A2").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlBottom
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = True
    End With
    Worksheets("Bx Data").Cells(1, 1) = UCase(client)
    Selection.Font.Size = 18
    Selection.Font.Bold = True
    Selection.Font.Italic = True
    MasterListFormat
    Cells(3, 2).Select
    ActiveWindow.FreezePanes = False
    ActiveWindow.FreezePanes = True
    
    Worksheets("Tutor Hr Data").Activate
    Cells.Select
    Range("BQ21").Activate
    Selection.ColumnWidth = 11
    Range("A1:A2").Select
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlBottom
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Selection.Merge
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlCenter
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = True
    End With
    Worksheets("Bx Data").Cells(1, 1) = UCase(client)
    Selection.Font.Size = 18
    Selection.Font.Bold = True
    Selection.Font.Italic = True
    Columns("A").Select
    Selection.Borders(xlDiagonalUp).LineStyle = xlNone
        With Selection.Borders(xlEdgeLeft)
            .LineStyle = xlContinuous
            .ColorIndex = 0
            .TintAndShade = 0
            .Weight = xlThin
        End With
    Selection.Borders(xlEdgeTop).LineStyle = xlNone
    Selection.Borders(xlEdgeBottom).LineStyle = xlNone
    Selection.Borders(xlEdgeRight).LineStyle = xlNone
    Selection.Borders(xlInsideVertical).LineStyle = xlNone
    Selection.Borders(xlInsideHorizontal).LineStyle = xlNone
    Selection.NumberFormat = "MMM yyyy"
    Worksheets("Tutor Hr Data").Cells(3, 1) = "Jan 2017"
    Worksheets("Tutor Hr Data").Cells(4, 1) = "Feb 2017"
    Worksheets("Tutor Hr Data").Cells(5, 1) = "Mar 2017"
    Worksheets("Tutor Hr Data").Cells(6, 1) = "Apr 2017"
    Worksheets("Tutor Hr Data").Cells(7, 1) = "May 2017"
    Worksheets("Tutor Hr Data").Cells(8, 1) = "Jun 2017"
    Worksheets("Tutor Hr Data").Cells(9, 1) = "Jul 2017"
    Worksheets("Tutor Hr Data").Cells(10, 1) = "Aug 2017"
    Worksheets("Tutor Hr Data").Cells(11, 1) = "Sep 2017"
    Worksheets("Tutor Hr Data").Cells(12, 1) = "Oct 2017"
    Worksheets("Tutor Hr Data").Cells(13, 1) = "Nov 2017"
    Worksheets("Tutor Hr Data").Cells(14, 1) = "Dec 2017"
    Cells(3, 1).Select
    ActiveWindow.FreezePanes = False
    ActiveWindow.FreezePanes = True
    Worksheets("Tutor Hr Data").Cells(1, 1) = UCase(client)
    
    Worksheets("Data").Activate
        
    ActiveWorkbook.SaveAs (FileName)
    ActiveWorkbook.Close
    
    MsgBox ("Data workbook for " & UCase(client) & " created.")

End Sub

Private Sub ActionReformat_Click()

    'Reformat and old style workbook
    Unload Me
    ActiveWindow.Zoom = 90
    CreateHeader
    EmptyBCheck
    MasterListFormat
    FormatProgramDates
    FindLastDate
    
    For i = 2 To Cells(2, 2000).End(xlToLeft).Column
        If Cells(2, i).Value = "Worksheets" Then
            With Cells(2, i)
                .Value = ""
                .Interior.Color = -4142
            End With
            With Cells(1, i)
                .Value = "Worksheets"
                .Interior.Color = RGB(255, 255, 0)
                .Font.Bold = True
            End With
        End If
    Next i
    
    Cells(4, 2).Select
    ActiveWindow.FreezePanes = False
    ActiveWindow.FreezePanes = True
    Cells(2000, 1).End(xlUp).Offset(1, 0).Value = Date

End Sub

Private Sub ActionRestructureSingle_Click()

    'Restructure a single program block
    Unload Me
    SingleRestructure
    UserAction.ActionFullService.Enabled = False
    
End Sub

Private Sub ActionRestuctureFull_Click()

    'Restructure all program blocks
    Unload Me
    MoveData
    UserAction.ActionRestuctureFull.Enabled = False
    UserAction.ActionRestructureSingle.Enabled = False
    
End Sub

Private Sub actionSaveWorkbook_Click()

    'Save as dialog box with suggested file name
    GetSaveAsFileName

End Sub

Private Sub btnArchive_Click()

    Dim filepath As String
    Dim i As Integer

    'Access client file archive information
    filepath = "C:\Users\jackie\Documents\Client File Archive List.xlsx"
    
    Set Y = Workbooks.Open(filepath)
    ActiveWindow.WindowState = xlMinimized
    
    For i = 2 To Y.Worksheets("Client File Archive").Cells(2, 4).End(xlDown).row
        With ArchiveBox.selectClient
            .AddItem Y.Worksheets("Client File Archive").Cells(i, 4).Value
        End With
    Next i
    
    Unload Me
    ArchiveBox.btnAdd.Enabled = False
    ArchiveBox.Show

End Sub

Private Sub CommandButton1_Click()

      On Error GoTo ErrorHandling
      
      'User submitted error message
      Call err.Raise(1342, "UserAction button", "User submitted message")
      
ErrorHandling:
    ErrHandling
          
End Sub

Private Sub CommandButton2_Click()

    Unload Me

End Sub

Private Sub CommandButton6_Click()

    X.Activate
    X.Worksheets("Data").Activate

End Sub


Private Sub UserForm_Click()

End Sub

Private Sub VerifyProgramNames_Click()

    Unload Me
    ImportSkillsPrograms
    RenamePrograms
    Application.DisplayAlerts = False
    For Each Worksheet In ActiveWorkbook.Worksheets
        Select Case Worksheet.Name
            Case Is = "PD"
                Worksheets("PD").Delete
            Case Is = "CI"
                Worksheets("CI").Delete
            Case Is = "SDL"
                Worksheets("SDL").Delete
            Case Is = "Current"
                Worksheets("Current").Delete
            Case Is = "Programs"
                Worksheets("Programs").Delete
        End Select
    Next
    Application.DisplayAlerts = True
    
End Sub

Private Sub version_Click()

AboutBox.version.Caption = version
    
    AboutBox.Show

End Sub
