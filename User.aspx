<%@ Page Language="VB" AutoEventWireup="false" CodeFile="User.aspx.vb" Inherits="User" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        html,body,form {
            height:100%;
            background:url(image/userbackground.jpg) center no-repeat;
            background-size:cover;
            padding:0px;
            margin:0px;
            overflow:hidden;
        }
        #CornerFolded {
            position:absolute;
            margin:0px;
            width:220px;
            height:133px;
            background:url(image/cornerfolded.png) left top no-repeat;
        }
        #CloseButton {
            width :48px;
            height:63px;
            margin:7px;
            background:url(image/button_normal.png) no-repeat;
            border:0px;
        }
        #CloseButton:active {
            background:url(image/button_press.png) no-repeat;
        }
        #CloseButton:hover {
            background:url(image/button_enter.png) no-repeat;
        }
        #UserArea {
            position:absolute;
            left:10%;
            top:100%;
            width:360px;
            height:440px;
            background:url(image/notepad.png) no-repeat;
        }
        #Group {
            position:absolute;
            left:55%;
            top:15%;
        }
        #GroupNameList {
            box-shadow: 0px 0px 25px black;
            background-color:rgba(180,180,180,0.3);
            padding:20px;
            outline: 1px solid rgba(127,255,255,0.75);
            font-family:微软雅黑;
            text-shadow:0px 0px 7px red;
            font-size:18px;
            color:#fff;
        }
        #WishesButton {
            box-shadow: 0px 0px 15px black;
            text-align:center;
            background-color:rgba(127,255,255,0.2) ;
            font-family:微软雅黑;
            color:#ffffff;
            text-shadow:0px 0px 3px black;
            outline: 1px solid rgba(127,255,255,0.75);
            border: 0px;
            padding: 5px 10px;
            cursor: pointer;
        }
        #WishesButton:hover {
            background-color: rgba(0,255,255,0.5);
        }
        #WishesButton:active {
            color: #ccc;
            background-color: rgba(0,255,255,0.75);
        }
        UserNameTable {
            border:1px dashed red;
        }
        .auto-style1 {
            width: 100%;
            border-spacing:15px,1px;
        }
    </style>
</head>
<body onload="ShowUser();">
    <form id="UserForm" runat="server" style="height:100%">
        <div id ="CornerFolded">
            <asp:Button ID="CloseButton" runat="server" />
        </div>
        <div id="UserArea"></div>
        <div id="Group">
            <div id="GroupNameList">
                所代表小组成员名单：
                <table style="text-align:left;" class="auto-style1">
                    <tr style="color :yellow">
                        <!--主要生产力，哈哈-->
                        <td>1.</td><td>刘子超</td><td>20148110238</td>
                    </tr>
                    <tr><td>2.</td><td>Name_1</td><td>Number_1</td></tr>
                    <tr><td>3.</td><td>Name_2</td><td>Number_2</td></tr>
                    <tr><td>4.</td><td>Name_3</td><td>Number_3</td></tr>
                    <tr><td>5.</td><td>Name_4</td><td>Number_4</td></tr>
                    <tr><td>6.</td><td>Name_5</td><td>Number_5</td></tr>
                    <tr><td>7.</td><td>Name_6</td><td>Number_6</td></tr>
                    <tr><td>8.</td><td>Name_7</td><td>Number_7</td></tr>
                    <tr><td>9.</td><td>Name_8</td><td>Number_8</td></tr>
                    <tr><td>10.</td><td>Name_9</td><td>Number_9</td></tr>
                    <tr><td>11.</td><td>Name_10</td><td>Number_10</td></tr>
                    <tr><td>12.</td><td>Name_11</td><td>Number_11</td></tr>
                    <tr><td>13.</td><td>Name_12</td><td>Number_12</td></tr>
                    <tr><td>14.</td><td>Name_13</td><td>Number_13</td></tr>
                </table>
            </div>
            <br />
            <div id="WishesButton">祝：工作顺利！生活愉快！</div>
        </div>
    </form>
    <script>
        var Height = document.body.clientHeight;
        var Top = Height;
        var EndTop = Height * 0.15;
        function ShowUser()
        {
            Top -= 20;
            UserArea.style.top = Top + "px";
            if (Top > EndTop) window.setTimeout("ShowUser();", 15);
        }
    </script>
</body>
</html>
