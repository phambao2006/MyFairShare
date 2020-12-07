<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOUSEHOLD.aspx.cs" Inherits="myFairShare_WebApp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>
<body class="main">
    <form id="form1" runat="server" class="main">
        <h1 class="pageTitles">Household</h1>
<div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="btnNewMember" runat="server" OnClick="btnNewMember_Click" Text="Add Member" TabIndex="1" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar" />
    <asp:Button ID="Button4" runat="server" OnClick="GO_BACK_Click" Text="Go Back" TabIndex="2" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar" />
        <asp:Button ID="Button5" runat="server" OnClick="btn_Logout" Text="Logout" CausesValidation="False" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="8" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" Height="40px" Width="135px"  CssClass="buttonINbar">Need help?</asp:HyperLink>
        <br />
    </div>
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
<div id="text-center">
    <p>
        &nbsp;<asp:GridView  ID="GridView1" style="margin-left:120px;" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="MemberId" DataSourceID="SqlDataSourceMember" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" Height="260px" Width="376px" AllowPaging="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                <asp:BoundField DataField="Debt" HeaderText="Debt" SortExpression="Debt" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMember" runat="server" ConnectionString="<%$ ConnectionStrings:myfairshareConnectionString %>" DeleteCommand="DELETE FROM [Payment] WHERE [MemberId] = @original_MemberId; DELETE FROM [Member] WHERE [MemberId] = @original_MemberId"  OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [MemberId], [Name], [Income], [Debt], [AcctId] FROM [Member] WHERE ([AcctId] = @AcctId)" UpdateCommand="UPDATE [Member] SET [Name] = @Name, [Income] = @Income, [Debt] = @Debt WHERE [MemberId] = @original_MemberId ">
            <DeleteParameters>
                <asp:Parameter Name="original_MemberId" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="AcctId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Income" Type="Decimal" />
                <asp:Parameter Name="Debt" Type="Decimal" />
                <asp:Parameter Name="original_MemberId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</div>
    </form>
</body>
</html>
