# Outlook Notes

Outlook has quite good functionality, but somethings can be made better...

## Borders Around Images
When you insert a picture into an email, Outlook doesn't put borders around the image. This can be problematic if you are inserting picutres with lots of white around the edges.

To place a single black border to all images in an email:

1. Press Alt+F11 to get into the VBA editor
2. If you are familiar with this screen, either add this VBA code into a module, or 
3. Download this [pre-made module](Outlook_Tools.bas)
4. Right click in the top left section of the screen, "Import file" and choose the file above


```VBA
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
```


Tie this macro to a button when in an email:
 
1. Click the down arrow at the top of the ribbon and "More Commands" 
2. Choose commands from "Macros"
3. Move "AddPictureBorder" to the right column
4. "Modify" and add your own icon
5. OK

Now when in an email, simply click your new macro button and all your pictures in the email will have a border.
si test