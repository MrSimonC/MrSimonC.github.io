Attribute VB_Name = "Outlook_Tools"
Sub AddPictureBorder()
    'http://stackoverflow.com/questions/12420268/how-to-put-border-round-images-in-outlook-by-default with simon edit
    Set insp = Application.ActiveInspector
    If insp.CurrentItem.Class = olMail Then
        Set mail = insp.CurrentItem
        If insp.EditorType = olEditorWord Then
            Set wordActiveDocument = mail.GetInspector.WordEditor

            For Each oIshp In wordActiveDocument.InlineShapes 'in line with text
                With oIshp.Borders
                    .OutsideLineStyle = wdLineStyleSingle
                End With
            Next oIshp

            For Each oshp In wordActiveDocument.Shapes 'floating with text wraped around
                With oshp.Line
                    .Style = msoLineSingle
                End With
            Next oshp
        End If
    End If
End Sub