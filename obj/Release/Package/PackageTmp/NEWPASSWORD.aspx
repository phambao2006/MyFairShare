<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NEWPASSWORD.aspx.cs" Inherits="myFairShare_WebApp.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>
<body class="main">
    <form id="form1" runat="server" class="main">
    <h1 class="pageTitles">New Password</h1>
<div class="sidenavbar">
<div class ="insidenavbar">
    <asp:Button ID="btnBack" runat="server" OnClick="Back_Click" Text="Go Back" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar"/>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="8" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar">Need help?</asp:HyperLink>
    <br />
</div>
<asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
    </div>
        <div id="text-center" style="background-color: #00CC00; height:480px;
        width: 760px; margin:auto">
        <p class="auto-style1"><asp:Label ID="lblPassword" runat="server" Text="New Password: "></asp:Label>
        <asp:TextBox ID="txtBox_Password" runat="server" TextMode="Password" TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBox_Password" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="PasswordValidator" runat="server" ControlToValidate="txtBox_Password" Display="Dynamic" ErrorMessage="Password must include at least 1 letter and 1 number and is at least 8 characters long" ForeColor="Red" ValidationExpression="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$"></asp:RegularExpressionValidator>
            </p>
        <p class="auto-style1"><asp:Label ID="lblPassword2" runat="server" Text="Repeat Password: "></asp:Label>
        <asp:TextBox ID="txtBox_Password2" runat="server" style="text-align: center" TextMode="Password" TabIndex="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtBox_Password2" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator" runat="server" ControlToCompare="txtBox_Password" ControlToValidate="txtBox_Password2" Display="Dynamic" ErrorMessage="Those passwords didn't match. Try again" ForeColor="Red"></asp:CompareValidator>
            </p>
            <p class="auto-style1">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </p>
        <p style="text-align: center">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnConfirm" runat="server" OnClick="Confirm_Click" Text="Confirm" TabIndex="3" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar"/>
            </p>
        </div>
    </form>
</body>
</html>
