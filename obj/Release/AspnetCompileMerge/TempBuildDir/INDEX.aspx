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
        <asp:Button ID="btnGuess" runat="server" Text="Guest Account" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px" UseSubmitBehavior="False" OnClick="btnGuess_Click" />
            <asp:HyperLink ID="hyperlinkForgot0" runat="server" NavigateUrl="~/FORGOTPASSWORD.aspx" TabIndex="5" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Medium" ForeColor="White" CssClass="buttonINbar" Height="35px" Width="128px"  >Reset Password</asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="4" CssClass="buttonINbar" Height="35px" Width="128px" >Help</asp:HyperLink>
    </div>
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
    <div id="text-center-frontpage">
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
            <br/>
             <asp:Button ID="Button2" runat="server" OnClick="SIGNIN_Click" Text="Sign in" TabIndex="3" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px"  />
        </p>
    </div>
    <div id="profile"> 
        <p>        <img class="profilepicture" src="Images/photo-min.png" /></p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="PHUC BAO PHAM" Font-Bold="True" Font-Size="X-Large"></asp:Label></p>
        <p>Aspiring Software Engineer, passionate
about implementing various software
applications using various languages.
Proficient in a variety of frameworks and
platforms. Eager to learn and conquer
problems!</p>
        <p>Phone: 281-673-0249</p>
        <p>Email:phambao2006@yahoo.com</p>
        <p>
            <asp:HyperLink  ID="linkedin" runat="server" NavigateUrl="https://www.linkedin.com/in/phuc-bao-pham/" ImageUrl="~/Images/linkedin.jpg"  Height="75px" ImageHeight="75px" ImageWidth="75px" Width="75px"></asp:HyperLink>
            <asp:HyperLink  ID="HyperLink3" runat="server"  NavigateUrl="https://github.com/phambao2006?tab=repositories" ImageUrl="~/Images/github-icon-for-resume-24.png" ImageHeight="70px" ImageWidth="70px" Width="75px"></asp:HyperLink>
        </p>
    </div>
    <div id="description">
        <p class="center"><asp:Label ID="Label2" runat="server" Text="My Fair Share" Font-Bold="True" Font-Size="X-Large"></asp:Label></p>        
        <p> &nbsp;&nbsp;&nbsp;&nbsp;Traditionally, when splitting bills, it is shown that families will split a bill proportionate on the bills total with little consideration to the income earning of those paying the bill itself. This poses a problem as someone with an income of $18,000/yr. paying ½ of a bill when the other fraction is paid by an earner with $50,000/yr. ends up paying a disproportionate amount compared to their actual income. This leaves the lower earning debtor with less spending power. This app aims to eliminate the disparity.</p>
        <p> &nbsp;&nbsp;&nbsp;&nbsp;The purpose of My Fair Share budgeting app is to allow end users to split bills proportionally based upon individual’s earnings in the overall household income. The reasoning behind this app is to provide a fairer distribution of funds for those who are lower income than their peers and create a surplus of funds that they can then spend on assets and other means of saving. This is achieved by providing a tool that tackles the biggest financial burden couples and roommates share, bills.</p>
        <p>Note: The purpose of Guest Account is to demonstrate app features and skillset.</p>
        <p class="center">Thank You for Checking It Out</p>
    </div>
</form>
</body>
</html>
