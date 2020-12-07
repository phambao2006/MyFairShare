<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BILLS.aspx.cs" Inherits="myFairShare_WebApp.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="StyleSheet1.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet"/> 
</head>

<body class="main">
    <form id="form1" runat="server" class="main">
<h1 class="pageTitles">BILLS</h1>
<div class="sidenavbar">
    <div class ="insidenavbar">
        <asp:Button ID="Button1" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" OnClick="btn_CreateBill_Click" Text="Create Bill" TabIndex="1" Width="135px" CssClass="buttonINbar" Height="40px"  />
        <asp:Button ID="Button2" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" OnClick="Button2_Click" Text="Add Payee" TabIndex="2" CssClass="buttonINbar" Height="40px" Width="135px"  />
        <asp:Button ID="btn_GoBack" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" OnClick="GOBACK__Click" Text="Go Back" TabIndex="3" CausesValidation="False" CssClass="buttonINbar" Height="40px" Width="135px"  />
        <asp:Button ID="btn_Logout" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" OnClick="btn_Logout_Click" Text="Logout" CausesValidation="False" CssClass="buttonINbar" Height="40px" Width="135px"  />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" BackColor="Black" BorderColor="#00CC00" BorderWidth="3px" Font-Size="Large" ForeColor="White" NavigateUrl="~/SUPPORT.aspx" Target="_blank" TabIndex="4" CssClass="buttonINbar" Height="35px" Width="128px" Font-Bold="False" Font-Underline="False" >Help</asp:HyperLink>
    </div>
        <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/Images/Logo.png" Width="155px" />
        </div>
<div id="text-center">
    <p >
        <asp:GridView  ID="GridView1" style="margin-left:80px;" runat="server" AutoGenerateColumns="False" DataKeyNames="BillId" DataSourceID="SqlDataSourceBills" AllowSorting="True" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2" AllowPaging="True">
            <AlternatingRowStyle BorderColor="Black" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" />
                <asp:BoundField DataField="LateAmount" HeaderText="LateAmount" SortExpression="LateAmount" />
                <asp:BoundField DataField="Balance" HeaderText="Balance" SortExpression="Balance" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" BorderColor="#00CC00" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceBills" runat="server" ConnectionString="<%$ ConnectionStrings:myfairshareConnectionString %>" DeleteCommand="DELETE FROM [Payment] WHERE [BillId] = @original_BillId; DELETE FROM [Bill] WHERE [BillId] = @original_BillId AND [Name] = @original_Name AND [Amount] = @original_Amount AND [DueDate] = @original_DueDate AND (([LateAmount] = @original_LateAmount) OR ([LateAmount] IS NULL AND @original_LateAmount IS NULL)) AND (([Balance] = @original_Balance) OR ([Balance] IS NULL AND @original_Balance IS NULL))" InsertCommand="INSERT INTO [Bill] ([Name], [Amount], [DueDate], [LateAmount], [Balance]) VALUES (@Name, @Amount, @DueDate, @LateAmount, @Balance)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [BillId], [Name], [Amount], FORMAT([DueDate], 'MM/dd/yyyy') AS [DueDate], [LateAmount], [Balance] FROM [Bill] WHERE ([AcctId] = @AcctId) ORDER BY [DueDate]" UpdateCommand="UPDATE [Bill] SET [Name] = @Name, [Amount] = @Amount, [DueDate] = @DueDate, [LateAmount] = @LateAmount, [Balance] = @Balance WHERE [BillId] = @original_BillId AND [Name] = @original_Name AND [Amount] = @original_Amount AND [DueDate] = @original_DueDate AND (([LateAmount] = @original_LateAmount) OR ([LateAmount] IS NULL AND @original_LateAmount IS NULL)) AND (([Balance] = @original_Balance) OR ([Balance] IS NULL AND @original_Balance IS NULL))" ConflictDetection="CompareAllValues">
            <DeleteParameters>
                <asp:Parameter Name="original_BillId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_DueDate" />
                <asp:Parameter Name="original_LateAmount" Type="Decimal" />
                <asp:Parameter Name="original_Balance" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="DueDate" />
                <asp:Parameter Name="LateAmount" Type="Decimal" />
                <asp:Parameter Name="Balance" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="AcctId" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Amount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="DueDate" />
                <asp:Parameter Name="LateAmount" Type="Decimal" />
                <asp:Parameter Name="Balance" Type="Decimal" />
                <asp:Parameter Name="original_BillId" Type="Int32" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Amount" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="original_DueDate" />
                <asp:Parameter Name="original_LateAmount" Type="Decimal" />
                <asp:Parameter Name="original_Balance" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </p>
</div>
            <div class="video-container">
        <video autoplay playsinline loop muted id="dollarVideo">
        <source src="Images/DollarsRain.mp4" type="video/mp4" ></video>
    </div>
    </form>
</body>
</html>
