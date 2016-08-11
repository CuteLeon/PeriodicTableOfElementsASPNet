
Partial Class LoginIn
    Inherits System.Web.UI.Page

    Dim WallpaperIndex As Integer = 0

    Protected Sub LoginButton_Click(sender As Object, e As EventArgs) Handles LoginButton.Click
        If LoginButton.Text <> "进入3D元素周期表" Then Exit Sub

        If UserNameText.Text.Trim = vbNullString Then
            ErrorLabel.Text = "请输入用户名！"
            UserNameText.BackColor = Drawing.Color.Pink
            UserNameText.Focus()
            Exit Sub
        End If
        UserNameText.BackColor = Drawing.Color.White

        If PasswordText.Text.Trim = vbNullString Then
            ErrorLabel.Text = "请输入密码！"
            PasswordText.BackColor = Drawing.Color.Pink
            PasswordText.Focus()
            Exit Sub
        End If
        PasswordText.BackColor = Drawing.Color.White

        '使用Session在页面间传递用户名
        Session.Add("UserName", UserNameText.Text)
        '切换界面
        Response.Redirect("index.aspx")
    End Sub

End Class
