<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FORGOTPASSWORD.aspx.cs" Inherits="myFairShare_WebApp.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>
<body class="main">
    <form id="form1" runat="server" class="main">
        <h1 class="pageTitles">Forgot Password</h1>
        <div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btnBack" runat="server" OnClick="Back_Click" Text="Login" CausesValidation="False" TabIndex="7" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar"  />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="8" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar">Need help?</asp:HyperLink>
        <br />
    </div>
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
<div id="text-center">
    <p class="auto-style1"><asp:Label ID="lblUsername" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="txtBox_Username" runat="server" TabIndex="1" AutoPostBack="True" OnTextChanged="txtBox_Username_TextChanged"></asp:TextBox>
        &nbsp;<asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Username does not exist" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator>
        </p>
    <p class="auto-style1">
        <asp:Label ID="lblSecurity1" runat="server" Text="Security Question 1:"></asp:Label>
&nbsp;<asp:DropDownList ID="dropbox_SecurityQuestion1" runat="server" TabIndex="2" Enabled="False">
            <asp:ListItem Value="01" Text="What is the name of your favorite childhood friend?"></asp:ListItem>
            <asp:ListItem Value="02" Text="What school did you attend for sixth grade?"></asp:ListItem>
            <asp:ListItem Value="03" Text="In what city or town was your first job?"></asp:ListItem>
            <asp:ListItem Value="04" Text="Where were you when you had your first kiss?"></asp:ListItem>
            <asp:ListItem Value="05" Text="What is the last name of your third grade teacher?"></asp:ListItem>
            <asp:ListItem Value="06" Text="What is your dream job?"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p class="auto-style1"><asp:Label ID="lblAnswer" runat="server" Text="Answer: "></asp:Label>
        <asp:TextBox ID="txtBox_Answer1" runat="server" TabIndex="3"></asp:TextBox>
        </p>
    <p class="auto-style1">
        <asp:Label ID="lblSecurity2" runat="server" Text="Security Question 2: "></asp:Label>
        <asp:DropDownList ID="dropbox_SecurityQuestion2" runat="server" TabIndex="4" Enabled="False">
            <asp:ListItem Value="01" Text="What is your preferred musical genre?"></asp:ListItem>
            <asp:ListItem Value="02" Text="What was your High School's mascot?"></asp:ListItem>
            <asp:ListItem Value="03" Text="What was the first concert you attended?"></asp:ListItem>
            <asp:ListItem Value="04" Text="Who was your childhood hero?"></asp:ListItem>
            <asp:ListItem Value="05" Text="What was the name of your first stuffed animal?"></asp:ListItem>
            <asp:ListItem Value="06" Text="What is your mother's middle name?"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p class="auto-style1"><asp:Label ID="lblAnswer0" runat="server" Text="Answer: "></asp:Label>
        <asp:TextBox ID="txtBox_Answer2" runat="server" TabIndex="5"></asp:TextBox>
        </p>
    <p class="auto-style1">
        <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </p>
    <p class="auto-style1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnRegister" runat="server" OnClick="Reset_Click" Text="Reset Password" TabIndex="6" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar" />
        </p>
</div>
            <div class="video-container">
        <video autoplay playsinline loop muted id="dollarVideo">
        <source src="Images/DollarsRain.mp4" type="video/mp4" ></video>
    </div>
    </form>
</body>
</html>
