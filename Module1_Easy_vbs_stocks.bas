Attribute VB_Name = "Module1"
Sub Stocks()

Dim volume As Double
Dim ws As Worksheet

For Each ws In Worksheets
    'Set title row
    ws.Range("I1").Value = "Ticker"
    ws.Range("J1").Value = "Total Stock Volume"
'Personal note. you kept messing up on the calls to the colums and rows of the spreadsheets. sp ws.range and ws.cells- keep in mind for later.
'wellsFargo_pt1 from 2.3 Getting real with VBA/Activites/ stu_wellsFargo- most help.
    ' Set initial values
    j = 0
    Total = 0
    Start = 2

    ' get the row number of the last row with data
    RowCount = Cells(Rows.Count, "A").End(xlUp).Row

        For i = 2 To RowCount
            'If ticker changes then print results
            If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
                ' Stores results in variables
                Total = Total + ws.Cells(i, 7).Value

                ' Handle zero total volume
                If Total = 0 Then
                    ' print the results
                    ws.Range("I" & 2 + j).Value = Cells(i, 1).Value
                    ws.Range("J" & 2 + j).Value = 0
        
                Else
        
                    ' Find First non zero starting value
                    If ws.Cells(Start, 3) = 0 Then
                        For find_value = Start To i
                            If ws.Cells(find_value, 3).Value <> 0 Then
        
                                Start = find_value
                                Exit For
                            End If
                        Next find_value
                    End If
                    ' start of the next stock ticker
                    Start = i + 1

                    ' print the results
                    ws.Range("I" & 2 + j).Value = ws.Cells(i, 1).Value
                    ws.Range("J" & 2 + j).Value = Total
            End If
        
                'reset: variables for new stock ticker
                Total = 0
                j = j + 1


        ' If ticker is still the same add results
        Else
            Total = Total + ws.Cells(i, 7).Value
        End If
    Next i
Next ws

End Sub
