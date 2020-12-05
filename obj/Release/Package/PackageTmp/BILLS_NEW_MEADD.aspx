<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BILLS_NEW_MEADD.aspx.cs" Inherits="myFairShare_WebApp.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
    <style type="text/css">
        .auto-style2 {
            margin-top: 0px;
            width: 424px;
        }
        </style>
</head>
<body class="main">
<form id="form1" runat="server" class="main">
    <h1 class="pageTitles">CREATE A BILL</h1>
<div id="text-center" class="auto-style1">
<div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btn_SaveMember" runat="server" OnClick="SAVE_Click" Text="Save Bill" TabIndex="4" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Width="135px" CssClass="buttonINbar" Height="40px" /> 
        <asp:Button ID="btn_PreviousScreen" runat="server" OnClick="btn_PreviousScreen_Click" Text="Go Back" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Width="135px" CssClass="buttonINbar" Height="40px" />
        <asp:Button ID="Button1" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" OnClick="btn_Logout" Text="Logout" CausesValidation="False" Width="135px" CssClass="buttonINbar" Height="40px" />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" TabIndex="5" Width="135px" CssClass="buttonINbar" Height="40px" >Help</asp:HyperLink>
        <br />
    </div>
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
        <table class="auto-style2" style="width:100%;">
            <tr>
                <td class="auto-style2">
                    &nbsp;<asp:Label ID="Label1" style="float: left; text-align: right;margin-left:145px;" runat="server" Text="Name of Bill:"></asp:Label>&nbsp;
                    <asp:TextBox ID="txtBox_Name"  style="margin-right: 145px; float:right;" runat="server" TabIndex="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_Name" runat="server" ControlToValidate="txtBox_Name" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;<asp:Label ID="Label2" style="float: left; text-align: right;margin-left:145px;" runat="server" Text="Total Amount Due:"></asp:Label>&nbsp;
                    <asp:TextBox ID="txtBox_DueAmount"  style="margin-right: 145px; float:right;" runat="server" ValidationExpression="((\d+)((\.\d{1,2})?))$" TabIndex="2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_Total" runat="server" ControlToValidate="txtBox_DueAmount" ErrorMessage="*Required. Numbers Only. " ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label ID="Label4" style="float: left; text-align: right;margin-left:145px;" runat="server" Text="Late Amount (Optional):"></asp:Label>
                    <asp:TextBox ID="txtLate" style="margin-right: 145px; float:right;"  runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;<asp:Label ID="Label3" style="float: left; text-align: right;margin-left:145px;" runat="server" Text="Due Date:"></asp:Label>&nbsp;
                    <asp:TextBox ID="txtBox_DueDate"  style="margin-right: 145px; float:right;" runat="server" TabIndex="3" TextMode="Date" Width="150px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="Validation_DueDate" runat="server" ControlToValidate="txtBox_DueDate" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                </td>
            </tr>
        </table>
</div>
        <div class="video-container">
        <video autoplay playsinline loop muted id="dollarVideo">
        <source src="Images/DollarsRain.mp4" type="video/mp4" ></video>
    </div>
    </form>
</body>
</html>
