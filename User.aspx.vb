
Partial Class User
    Inherits System.Web.UI.Page

    Private Sub UserForm_Init(sender As Object, e As EventArgs) Handles UserForm.Init
        '根据用户名设置网页标题
        Page.Title = Session("UserName") & " - 用户信息"
    End Sub
    Protected Sub CloseButton_Click(sender As Object, e As EventArgs) Handles CloseButton.Click
        Response.Redirect("Index.aspx")
    End Sub
End Class
