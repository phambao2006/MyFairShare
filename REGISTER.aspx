<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="REGISTER.aspx.cs" Inherits="myFairShare_WebApp.WebForm9" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />
</head>

<body class="main">
    <h1 class="pageTitles">Register Account</h1>
    <form id="form1" runat="server" class="main">

        <div class="sidenavbar">
            <div class="insidenavbar">
                <asp:Button ID="btnBack" runat="server" OnClick="Back_Click" Text="Go Back" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px" CssClass="buttonINbar" />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="8" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px" CssClass="buttonINbar">Need help?</asp:HyperLink>
                <br />
            </div>
            <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>

        <div id="text-center1">
            <table style="margin-left: 50px;margin:auto; ">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Style=" font-size: 9px;" runat="server" ControlToValidate="txtBox_Username" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="UsernameValidator" Style=" font-size: 9px;" runat="server" ControlToValidate="txtBox_Username" Display="Dynamic" ErrorMessage="Username must include only letters and numbers and at least 3 characters" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9]{3,15}$"></asp:RegularExpressionValidator>
                        <asp:CustomValidator ID="CVUsername" runat="server" Display="Dynamic" ErrorMessage="Username is taken" ForeColor="Red" OnServerValidate="CVUsername_ServerValidate" ControlToValidate="txtBox_Username"></asp:CustomValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblUsername" Style="float: left; margin-left: 50px;" runat="server" Text="Username: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBox_Username" Style=" width: 200px; " runat="server" CausesValidation="True" MaxLength="15" TabIndex="1"></asp:TextBox></td>



                </tr>
                <tr>
                    
                         <td></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Style=" font-size: 9px;" runat="server" ControlToValidate="txtBox_Password" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="PasswordValidator" Style=" font-size: 9px;text-align:center;" runat="server" ControlToValidate="txtBox_Password" Display="Dynamic" ErrorMessage="Password must include at least 1 lowercase, 1 uppercase, 1 number and is at least 8 characters long" ForeColor="Red" ValidationExpression="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{8,32}$"></asp:RegularExpressionValidator>

                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword" Style="float: left; margin-left: 50px;" runat="server" Text="Password: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBox_Password" Style="width: 200px; " runat="server" MaxLength="32" TextMode="Password"></asp:TextBox></td>

                </tr>
                <tr>
                     
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Style=" font-size: 9px;" runat="server" ControlToValidate="txtBox_Password2" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator" runat="server" Style=" font-size: 9px;" ControlToCompare="txtBox_Password" ControlToValidate="txtBox_Password2" Display="Dynamic" ErrorMessage="Those passwords didn't match. Try again" ForeColor="Red"></asp:CompareValidator>

                        </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPassword2" Style="float: left; margin-left: 50px;" runat="server" Text="Repeat Password: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBox_Password2" Style="width: 200px; " runat="server" CausesValidation="True" MaxLength="32" TextMode="Password"></asp:TextBox></td>


                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSecurity1" Style="float: left; margin-left: 50px;" runat="server" Text="Security Question 1:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="dropbox_SecurityQuestion1" Style="width: 208px;  text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" runat="server">
                            <asp:ListItem Value="0" Text="What is the name of your favorite childhood friend?"></asp:ListItem>
                            <asp:ListItem Value="1" Text="What school did you attend for sixth grade?"></asp:ListItem>
                            <asp:ListItem Value="2" Text="In what city or town was your first job?"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Where were you when you had your first kiss?"></asp:ListItem>
                            <asp:ListItem Text="What is the last name of your third grade teacher?" Value="4"></asp:ListItem>
                            <asp:ListItem Value="5" Text="What is your dream job?"></asp:ListItem>
                        </asp:DropDownList></td>

                </tr>
                <tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Style=" font-size: 9px;" runat="server" ControlToValidate="txtBox_Answer1" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <td>
                        <asp:Label ID="lblAnswer" Style="float: left; margin-left: 50px;" runat="server" Text="Answer: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBox_Answer1" Style="width: 200px; " runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSecurity2" Style="float: left; margin-left: 50px;" runat="server" Text="Security Question 2: "></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="dropbox_SecurityQuestion2" Style="width: 208px;   text-overflow: ellipsis; overflow: hidden; white-space: nowrap;" runat="server">
                            <asp:ListItem Value="0" Text="What is your preferred musical genre?"></asp:ListItem>
                            <asp:ListItem Value="1" Text="What was your High School's mascot?"></asp:ListItem>
                            <asp:ListItem Value="2" Text="What was the first concert you attended?"></asp:ListItem>
                            <asp:ListItem Value="3" Text="Who was your childhood hero?"></asp:ListItem>
                            <asp:ListItem Value="4" Text="What was the name of your first stuffed animal?"></asp:ListItem>
                            <asp:ListItem Value="5" Text="What is your mother's middle name?"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Style="  font-size: 9px;" runat="server" ControlToValidate="txtBox_Answer2" ErrorMessage="*Required " ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAnswer2" Style="float: left; margin-left: 50px;" runat="server" Text="Answer: "></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtBox_Answer2" Style="width: 200px;  " runat="server"></asp:TextBox></td>

                </tr>
            </table>
            <p class="auto-style1">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="I agree to the" />
                &nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Content/Terms-of-service-v2.pdf" Target="_blank">Terms of Service</asp:HyperLink>
                <asp:CustomValidator ID="CustomValidator1" Style="float: right;" runat="server" ErrorMessage="*Required" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
            </p>

            <p class="auto-style1">
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnRegister" runat="server" OnClick="Register_Click" Text="Register" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px" CssClass="buttonINbar" />
            </p>
        </div>
        <div class="video-container">
            <video autoplay playsinline loop muted id="dollarVideo">
                <source src="Images/DollarsRain.mp4" type="video/mp4"></video>
        </div>
    </form>
</body>
</html>
