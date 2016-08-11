
Partial Class Index
    Inherits System.Web.UI.Page

    Private Sub Index_Init(sender As Object, e As EventArgs) Handles Me.Init
        Try
            UserButton.Text = Session.Item("UserName").ToString()
        Catch ex As Exception
            UserButton.Text = "Leon."
        End Try
    End Sub

    Protected Sub BackButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("LoginIn.aspx")
    End Sub

    Protected Sub UserButton_Click(sender As Object, e As EventArgs)
        Response.Redirect("user.aspx")
    End Sub
End Class
