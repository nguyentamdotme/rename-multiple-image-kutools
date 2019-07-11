Attribute VB_Name = "Load_File_Dir"
Sub PictureNametoExcel()
'UpdatebyExtendoffice201709027
    Dim I As Long
    Dim xRg As Range
    Dim xAddress As String
    Dim xFileName As String
    Dim xFileDlg As FileDialog
    Dim xFileDlgItem As Variant
    On Error Resume Next
    xAddress = ActiveWindow.RangeSelection.Address
    Set xRg = Application.InputBox("Select a cell to place name list:", "KuTools For Excel", xAddress, , , , , 8)
    If xRg Is Nothing Then Exit Sub
    Application.ScreenUpdating = False
    Set xRg = xRg(1)
    xRg.Value = "Picture Name"
    With xRg.Font
    .Name = "Arial"
    .FontStyle = "Bold"
    .Size = 10
    End With
    xRg.EntireColumn.AutoFit
    Set xFileDlg = Application.FileDialog(msoFileDialogFolderPicker)
    I = 1
    If xFileDlg.Show = -1 Then
        xFileDlgItem = xFileDlg.SelectedItems.Item(1)
        xFileName = Dir(xFileDlgItem & "\")
        Do While xFileName <> ""
            If InStr(1, xFileName, ".jpg") + InStr(1, xFileName, ".JPG") + InStr(1, xFileName, ".png") + InStr(1, xFileName, ".PNG") + InStr(1, xFileName, ".img") + InStr(1, xFileName, ".ioc") + InStr(1, xFileName, ".bmp") > 0 Then
                xRg.Offset(I).Value = xFileDlgItem & "\" & xFileName
                I = I + 1
            End If
            xFileName = Dir
        Loop
    End If
    Application.ScreenUpdating = True
End Sub
