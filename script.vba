
Sub CombineTables(loDest As ListObject, Optional lcSource As ListColumn)

Dim ws              As Worksheet
Dim lo              As ListObject
Dim lc              As ListColumn
Dim rDest           As Range
Dim lDestRows       As Long
Dim lSourceRows     As Long

Application.ScreenUpdating = False

If lcSource Is Nothing Then Set lcSource = loDest.ListColumns(1)
If loDest.ListRows.Count > 0 Then loDest.DataBodyRange.Delete

For Each ws In ActiveWorkbook.Worksheets
    For Each lo In ws.ListObjects
        If lo <> loDest Then
            With lo
                If InStr(.Name, loDest.Name & "_") > 0 Then
                    On Error Resume Next
                    lDestRows = loDest.ListRows.Count
                    On Error GoTo 0
                    lSourceRows = .ListRows.Count
                    If lSourceRows > 0 Then

                        'Work out where we want to paste the data to
                        Set rDest = loDest.HeaderRowRange.Offset(1 + lDestRows).Resize(lSourceRows)

                        'Resize the destination table
                        loDest.Resize loDest.Range.Resize(1 + lSourceRows + lDestRows)       

                        For Each lc In .ListColumns
                         Intersect(loDest.ListColumns(lc.Name).Range.EntireColumn, rDest).Value2 = lc.DataBodyRange.Value
                        Next lc
                        Set lc = Nothing
                        On Error Resume Next
                        Set lc = .ListColumns(lcSource.Name)
                        On Error GoTo 0
                        If lc Is Nothing Then Intersect(lcSource.Range, rDest.EntireRow).Value2 = ws.Name
                    End If
                End If
            End With
        End If
    Next lo
Next ws

Application.ScreenUpdating = True

End Sub

""""""""""""
"  Caller  "
""""""""""""

Sub CombineTables_Caller()
CombineTables [SomeName].ListObject, [SomeName].ListObject.ListColumns("Source")
End Sub

