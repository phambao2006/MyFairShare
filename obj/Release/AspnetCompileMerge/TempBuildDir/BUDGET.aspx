<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BUDGET.aspx.cs" Inherits="myFairShare_WebApp.Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>

<body class="main">
    <form id="form1" runat="server" class="main">
            <h1 class="pageTitles">BUDGET</h1>
<div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="Button1" runat="server" OnClick="HOUSEHOLD_Click" Text="HOUSEHOLD" TabIndex="1" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar" />
        <asp:Button ID="Button2" runat="server" OnClick="BILLS_Click" Text="BILLS" TabIndex="2" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar"/>
        <asp:Button ID="button_GOBACK" runat="server" OnClick="GOBACK_Click" Text="Logout" TabIndex="7" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Bold="False" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar"/>
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="8" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="27px" Width="134px"  CssClass="buttonINbar">Need help?</asp:HyperLink>
        <br />
    </div>
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
<div id="text-center">
        <table style="width:100%;margin:auto;">
            <tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Bills"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Payee"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="PAYMENT SUMMARY"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lb_bills" style="width:150px; height:200px;" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="BillId" AutoPostBack="True" OnSelectedIndexChanged="lb_bills_SelectedIndexChanged" OnPreRender="lb_bills_PreRender"></asp:ListBox>
                    </td>
                <td>
                    <asp:ListBox ID="lbSelectedMember" style="width:150px; height:200px;" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lbSelectedMember_SelectedIndexChanged"></asp:ListBox>
                    </td>
                <td>
                <p>
                    <asp:Label ID="Label1" style="float: left; text-align: right;" runat="server" Text="Due Date:"></asp:Label>
&nbsp;
                    <asp:TextBox ID="txtBox_DueDate" style="margin-right: 75px; float:right;" runat="server"  ReadOnly="True" TabIndex="4" Enabled="False"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="label_Amount" style="float: left; text-align: right;" runat="server" Text="Amount:"></asp:Label>
&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="txtBox_Amount" style="margin-right: 75px; float:right;" runat="server" ReadOnly="True" TextMode="Number" TabIndex="5" Enabled="False"></asp:TextBox>
                    </p>
                    <p>
                        &nbsp;<asp:Label ID="lbLateFee" style="float: left; text-align: right;"  runat="server" Text="LateFee:"></asp:Label>
&nbsp;&nbsp;
                        <asp:TextBox ID="txtLateFee" style="margin-right: 75px; float:right;" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                    </p>
                    <p>
                        <asp:Label ID="Label2" style="float: left; text-align: right;" runat="server" Text="Total:"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtTotal" style="margin-right: 75px; float:right;" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                    </p>
               </td></tr>

    <tr><td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myfairshareConnectionString %>" SelectCommand="SELECT [BillId], [Name] FROM [Bill] WHERE (([AcctId] = @AcctId) AND [Balance] &gt; 0.01  AND ([DueDate] &lt; GETDATE())) ORDER BY [DueDate], [Name];">
                        <SelectParameters>
                            <asp:Parameter Name="AcctId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td><td>
                    &nbsp;</td><td>
            <asp:Button ID="btnPay" runat="server" OnClick="btnPay_Click" Text="Pay" Width="115px" />
        </td></tr></table>
&nbsp;
        <p>&nbsp;</p>
</div>
            <div class="video-container">
        <video autoplay playsinline loop muted id="dollarVideo">
        <source src="Images/DollarsRain.mp4" type="video/mp4" ></video>
    </div>
    </form>
</body>
</html>
