<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="INDEX.aspx.cs" Inherits="myFairShare_WebApp.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/>

</head>

<body class="main">
<form id="form1" runat="server" class="main">
<h1 class="pageTitles">MyFairShare</h1>
<div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btn_signup" runat="server" OnClick="SIGNUP_Click" Text="Sign up" CausesValidation="False" TabIndex="4" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px" UseSubmitBehavior="False" />
            <asp:Button ID="Button2" runat="server" OnClick="SIGNIN_Click" Text="Sign in" TabIndex="3" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px"  />
            <asp:HyperLink ID="hyperlinkForgot0" runat="server" NavigateUrl="~/FORGOTPASSWORD.aspx" TabIndex="5" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Medium" ForeColor="White" CssClass="buttonINbar" Height="35px" Width="128px"  >Reset Password</asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="4" CssClass="buttonINbar" Height="35px" Width="128px" >Help</asp:HyperLink>
    </div>
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
    <div id="text-center-frontpage">
        <p>&nbsp;</p>
        <p class="auto-style1">
            <asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label>
            <asp:TextBox ID="txtBox_Username" runat="server" Height="22px" TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBox_Username" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p class="auto-style1">
            <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
            <asp:TextBox ID="txtBox_Password" runat="server" Height="22px" TextMode="Password" TabIndex="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBox_Password" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p class="auto-style1">
            <asp:CustomValidator ID="CV_Login" runat="server" ErrorMessage="Incorrect Username or Password" ForeColor="Red" OnServerValidate="CV_Login_ServerValidate"></asp:CustomValidator>
        </p>
    </div>
    <div class="video-container">
        <video autoplay="autoplay" loop ="loop" muted id="dollarVideo">
            <source src="Images/DollarsRain.mp4" type="video/mp4"/></video>
    </div>
</form>
</body>
</html>
