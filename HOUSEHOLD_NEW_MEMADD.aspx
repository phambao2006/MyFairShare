<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOUSEHOLD_NEW_MEMADD.aspx.cs" Inherits="myFairShare_WebApp.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>
<body class="main">
<form id="form1" runat="server" class="main">
    <h1 class="pageTitles">Add Member to your Household</h1>
<div id="text-center">
    <div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btn_SaveMember" runat="server" OnClick="SAVE_Click" Text="Save Member" TabIndex="4" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Width="135px" CssClass="buttonINbar" Height="40px" />
        <asp:Button ID="btn_PreviousScreen" runat="server" OnClick="btn_PreviousScreen_Click" Text="Go Back" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Width="135px" CssClass="buttonINbar" Height="40px" />
        <asp:Button ID="Button1" runat="server" OnClick="btn_Logout" Text="Logout" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Width="135px" CssClass="buttonINbar" Height="40px"  />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" TabIndex="5" Width="135px" CssClass="buttonINbar" Height="40px" >Help</asp:HyperLink>
        <br />
    </div>
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
    <p>
        <table style="width:100%;">
            <tr><td class="auto-style2">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" style="float: left; text-align: right;margin-left:145px;"  runat="server" Text="Name:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtBox_Name" style="margin-right: 145px; float:right;" runat="server" TabIndex="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_Name" runat="server" ControlToValidate="txtBox_Name" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label2" style="float: left; text-align: right;margin-left:145px;"  runat="server" Text="Income:"></asp:Label>
 
                    <asp:TextBox ID="txtBox_Income" style="margin-right: 145px; float:right;"  runat="server" TextMode="Number" TabIndex="2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_Income" runat="server" ControlToValidate="txtBox_Income" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
    <td>
    </td></tr>

    <tr><td class="auto-style2">
        <asp:Label ID="Label3" style="float: left; text-align: right;margin-left:145px;"  runat="server" Text="Relationship:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtBox_Relationship" style="margin-right: 145px; float:right;"  runat="server" TabIndex="3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_Relationship" runat="server" ControlToValidate="txtBox_Relationship" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
        </td><td>&nbsp;</td><td>&nbsp;</td></tr></table></p>
    <p>
        &nbsp;</p>
</div>
        <div class="video-container">
        <video autoplay playsinline loop muted id="dollarVideo">
        <source src="Images/DollarsRain.mp4" type="video/mp4" ></video>
    </div>
    </form>
</body>
</html>
