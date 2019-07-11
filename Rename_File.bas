Attribute VB_Name = "Rename_File"
Sub RenameFile()
'UpdatebyExtendoffice20170927
    Dim I As Long
    Dim xLastRow As Long
    Dim xAddress As String
    Dim xRgS, xRgD As Range
    Dim xNumLeft, xNumRight As Long
    Dim xOldName, xNewName As String
    On Error Resume Next
    xAddress = ActiveWindow.RangeSelection.Address
    Set xRgS = Application.InputBox("Select Original Names(Single Column):", "KuTools For Excel", xAddress, , , , , 8)
    If xRgS Is Nothing Then Exit Sub
    Set xRgD = Application.InputBox("Select New Names(Single Column):", "KuTools For Excel", , , , , , 8)
    If xRgD Is Nothing Then Exit Sub
    Application.ScreenUpdating = False
    xLastRow = xRgS.Rows.Count
    Set xRgS = xRgS(1)
    Set xRgD = xRgD(1)
    For I = 1 To xLastRow
        xOldName = xRgS.Offset(I - 1).Value
        xNumLeft = InStrRev(xOldName, "\")
        xNumRight = InStrRev(xOldName, ".")
        xNewName = xRgD.Offset(I - 1).Value
        If xNewName <> "" Then
            xNewName = Left(xOldName, xNumLeft) & xNewName & Mid(xOldName, xNumRight)
            Name xOldName As xNewName
        End If
    Next
    MsgBox "Congratulations! You have successfully renamed all the files", vbInformation, "KuTools For Excel"
    Application.ScreenUpdating = True
End Sub
