<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoginIn.aspx.vb" Inherits="LoginIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>欢迎访问 3D元素周期表 [Leon]</title>
    <script src="./BJUI/js/jquery-1.7.2.min.js"></script>
    <script src="./BJUI/js/bjui-all.js"></script>
    <script src="./BJUI/plugins/bootstrapSelect/bootstrap-select.js"></script>
    <script src="./BJUI/plugins/bootstrapSelect/defaults-zh_CN.js"></script>
    <script src="./BJUI/plugins/bootstrap.js"></script>
    <link href="./BJUI/plugins/bootstrapSelect/bootstrap-select.css" rel="stylesheet"/>
    <link href="./BJUI/themes/css/bootstrap.css" rel="stylesheet"/>
    <style>
        html, body, form {
            height:100%;
            width:100%;
            margin: 0;
            border:none;
            overflow:hidden
        }
        #HeadStyle
        {
	        font-family:"方正综艺简体";
	        font-size:48px;
	        text-shadow:2px 2px 15px black;
	        color:#7fffff;
        }
        .LableStyle
        {
            font-family:"微软雅黑";
	        font-size:18px;
	        text-shadow:2px 2px 5px black;
	        color:#7fffff;
        }
        .ErrorLableStyle {
            font-family:"微软雅黑";
	        font-size:18px;
	        text-shadow:0px 0px 10px red;
	        color:rgba(255,255,255,1);
        }
        #WallpaperButton {
            position:absolute;
            margin:20px;
            right:20px;
            bottom:20px;
        }
    </style>
</head>
<body style="background:url(/image/Background_0.jpg);background-position:0px 0px;background-size:100% 100%;">
    <form id="LoginForm" runat="server" >
        <div id="loginArea" style="position:center ;top:30%;padding:30px;text-align:center;margin-top:5%;" aria-selected="undefined">
            <h1 id = "HeadStyle">欢迎访问：3D元素周期表</h1><br /><br /><br /><br /><br /><br /><br /><br />
            <asp:Label CssClass="LableStyle" Style="text-align:right" Width="130px" runat="server" Text="请输入用户名：" ></asp:Label>
            <asp:TextBox ID="UserNameText" runat="server" Text="Leon." Width="240px" style="display:table-column-group;"></asp:TextBox>
            <br /><br />
            <asp:Label CssClass="LableStyle" Style="text-align:right" Width="130px" runat="server" Text="请输入密码："></asp:Label>
            <asp:TextBox ID="PasswordText" runat="server" Width="240px" TextMode="Password"  style="display:table-row-group;"></asp:TextBox>
            <br /><br />
            <asp:Label CssClass="LableStyle" Style="text-align:right" Width="130px" runat="server" Text="选择登录类型："></asp:Label>
            <select data-toggle="selectpicker" data-width="240" class="show-tick" style="display: none;">
                <option value="0">普通用户</option>
                <option value="1">特权用户</option>
                <option value="2">管理员</option>
            </select>
            <br /><br />
            <asp:Label ID="ErrorLabel" CssClass="ErrorLableStyle" Style="text-align:center;" Width="130px" runat="server" ></asp:Label><!--用以显示错误信息-->
            <br /><br/>
            <asp:Button ID="LoginButton" runat="server" Text="进入3D元素周期表" ForeColor="#7fffff" CssClass="btn btn-primary btn-lg"/>
        </div>
        <!--千万不要把DIV换成Button！！！否则会刷新页面，壁纸无法生效-->
        <div id="WallpaperButton" onclick="changeWallpaper();" class="btn btn-primary btn-lg" >随机壁纸</div>
    </form>
    <script>
        $(function () { BJUI.init({}) });

        var WallpaperIndex = 0;
        function changeWallpaper()
        {
            document.body.style.background = "url(./image/background_" + WallpaperIndex + ".jpg)";
            document.body.style.backgroundPosition = "0px 0px";
            document.body.style.backgroundSize = "100% 100%";
            WallpaperIndex = (WallpaperIndex == 7) ? 0 : WallpaperIndex + 1;
        }
    </script>
</body>
</html>
