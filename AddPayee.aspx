<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPayee.aspx.cs" Inherits="myFairShare_WebApp.AddPayee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>
<body class="main">
    <form id="form1" runat="server" class="main">
    <h1 class="pageTitles">Add Payee</h1>
<div id="text-center">
    <div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="Go Back" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px"  />
        <asp:Button ID="btn_Logout01" runat="server" OnClick="btn_Logout" Text="Logout" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="buttonINbar" Height="40px" Width="135px"  />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="4" CssClass="buttonINbar" Height="35px" Width="128px" Font-Bold="False" Font-Underline="False" >Help</asp:HyperLink>
    </div>
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
    </div>
<div>
    <asp:ListBox ID="lbBills" style="width:150px; height:160px;" runat="server" DataSourceID="SqlDataSourceBills" DataTextField="Name" DataValueField="BillId" AutoPostBack="True" OnSelectedIndexChanged="lbBills_SelectedIndexChanged" CssClass="billlist"></asp:ListBox>
    <asp:SqlDataSource ID="SqlDataSourceBills" runat="server" ConnectionString="<%$ ConnectionStrings:myfairshareConnectionString %>" SelectCommand="SELECT [BillId], [Name] FROM [Bill] WHERE ([AcctId] = @AcctId)">
        <SelectParameters>
            <asp:Parameter Name="AcctId" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
    <div>
        <asp:ListBox ID="lbMembers" style="width:150px; height:160px;" runat="server" CssClass="memberlist"></asp:ListBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="&lt;&lt;Remove" TabIndex="1" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="removebtn" Height="40px" Width="135px" />
        <asp:Button ID="Button1" runat="server" Text="Add&gt;&gt;" OnClick="Button1_Click" TabIndex="2" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" CssClass="addbtn" Height="40px" Width="135px" />
        <asp:ListBox ID="lbSelectedMember"  style="width:150px; height:160px;" runat="server" CssClass="selectedmemberlist"></asp:ListBox>
    </div>

</div>
    </form>
</body>
</html>
