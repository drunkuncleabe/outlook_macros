Attribute VB_Name = "Module1"
'Outlook VB Macro to move selected mail item(s) to a target folder
Sub Move_to_2012()
On Error Resume Next

Dim ns As Outlook.NameSpace
Dim moveToFolder As Outlook.MAPIFolder
Dim objItem As Outlook.MailItem

Set ns = Application.GetNamespace("MAPI")

'Define path to the target folder
Set moveToFolder = ns.Folders("Mailbox - Kinney, Abraham").Folders("2012")

If Application.ActiveExplorer.Selection.Count = 0 Then
   MsgBox ("No item selected")
   Exit Sub
End If

If moveToFolder Is Nothing Then
   MsgBox "Target folder not found!", vbOKOnly + vbExclamation, "Move Macro Error"
End If

For Each objItem In Application.ActiveExplorer.Selection
   If moveToFolder.DefaultItemType = olMailItem Then
      If objItem.Class = olMail Then
         objItem.Move moveToFolder
      End If
  End If
Next

Set objItem = Nothing
Set moveToFolder = Nothing
Set ns = Nothing

End Sub

