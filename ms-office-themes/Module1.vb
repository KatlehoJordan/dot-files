Sub tempMacro()
'
' tempMacro Macro
' A temporary macro to automate some repetitive ad-hoc process
'

'
End Sub

Sub pasteValue()
'
' pasteValue Macro
' Pastes the value/s that is currently saved in the clipboard (not the formula)
'

'
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
End Sub

Sub followLink()
'
' followLink Macro
' Follows a hyperlink
'

'
    Selection.Hyperlinks(1).Follow NewWindow:=False, AddHistory:=True
End Sub

Sub jumpToLastTab()
'
' jumpToLastTab Macro
' Jumps to last tab in the workbook
'

'

Sheets(Sheets.Count).Activate

End Sub

Sub jumpToFirstTab()
'
' jumpToFirstTab Macro
' Jumps to first tab in the workbook
'

'

Sheets(1).Activate

End Sub

Sub jumpToA1()
'
' jumpToA1 Macro
' Jumps to cell A1 in a worksheet, even if there are frozen panes
'

'

Range("A1").Select

End Sub

Sub zoomOut()
'
' zoomOut Macro
' Zooms out
'

'
    ActiveWindow.Zoom = 0.75 * (ActiveWindow.Zoom)
End Sub

Sub zoomIn()
'
' zoomIn Macro
' Zooms in
'

'
    ActiveWindow.Zoom = 1.25 * (ActiveWindow.Zoom)
End Sub

