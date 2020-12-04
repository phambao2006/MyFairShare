<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SUPPORT.aspx.cs" Inherits="myFairShare_WebApp.WebForm11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

p.MsoListParagraphCxSpFirst
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
p.MsoListParagraphCxSpMiddle
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
p.MsoListParagraphCxSpLast
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:.5in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            FairShare Support Center</div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                Help Document<br />
                This is a help document to help users use and navigate the site better!<br /> 
                <br />
                Please select which page you would like help with below.<br />
                <br />
            </asp:View>
            <asp:View ID="View2" runat="server">
                Figure 6.1 – Landing Page
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Content/Images/Figure6.1.png" />
                <br />
                1. Username: Type in your chosen username here
                <br />
                2. Password: Type in your chosen password here
                <br />
                3. Sign Up: Click here to create a new account
                <br />
                4. Sign In: After entering your username and password. Click here to enter the website
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. Checks your credentials and sees if you are a valid user.
                <br />
                5. Forgot username/password(?): If you have forgotten your password click here to redirected to a page to recover your password.
                <br />
                6. Exit page- Hit the “x” to exit webpage (Optional) or navigate to another page via URL.
                <br />
                <br />
            </asp:View>
            <asp:View ID="View3" runat="server">
                Figure 6.2<br />
                <asp:Image ID="Image8" runat="server" ImageUrl="~/Content/Images/Figure6.2.png" />
                <br />
                1. Username Box: Type in desired Username in this box
                <br />
                2. Password Box: Type in desired password here (minimum required length: 8 characters)
                <br />
                3. Confirm Password box: Re-type in password for confirmation (typed in passwords must match)
                <br />
                4. Security Question 1 Box: Select a Security Question in this box. (Password Recovery)
                <br />
                5. Security Answer 1 Box: Type in your answer to Security Question 1 here.
                <br />
                6. Security Question 2 Box: Select a security question for box 2. (Password Recovery)
                <br />
                7. Security Answer 2 Box: Type in your answer to Security Question 2 here.
                <br />
                8. End User Agreement Checkmark Box: Select this box after you have read the TOS/EUA agreement.
                <br />
                9. Go back Button: This button takes you back to the Landing Page.
                <br />
                10. Register Button: Becomes selectable after you have read TOS/EUA agreement. Acts like pressing the Enter key and registers your account.
                <br />
                11. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.
                <br />
            </asp:View>
            <asp:View ID="View4" runat="server">
                Figure 6.3<br />
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Content/Images/Figure6.3.png" />
                <br />
                1. Username Box: Type your username into this box. (for password recovery purposes)
                <br />
                2. Security Question 1 Box: Your selected Security 1 question will appear in this box.
                <br />
                3. Answer Question 1 Box: Type in your answer to Security Question 1 in this box.
                <br />
                4. Security Question Box 2: Your selected Security 2 question will appear in this box.
                <br />
                5. Answer Question Box 2: Type in your answer to Security Question 2 in this box.
                <br />
                6. Go back Button: Takes you back to the Landing Page (Main Page/Title Page)
                <br />
                7. Submit Button: Confirms your answer. If correct, takes the user to the Password reset page.
                <br />
                8. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.
                <br />
            </asp:View>
            <asp:View ID="View5" runat="server">
                Figure 6.4<br />
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Content/Images/Figure6.4.png" />
                <br />
                1. Password Box: Type in new password here (8-character length, Includes special characters)
                <br />
                2. Confirm Password Box: Type in new password again to confirm password. Typed in passwords must match each other to be valid.
                <br />
                3. Go Back Button: Takes you back to the Forgot password screen.
                <br />
                4. Submit Button: Confirms your new password and redirects you to the Landing Page to log in with your new password.
                <br />
                5. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.<br />
            </asp:View>
            <asp:View ID="View6" runat="server">
                Figure 6.5<br />
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Content/Images/Figure6.5.png" />
                <br />
                1. Bill Name Box: Displays currently existing bills
                <br />
                2. Household Box: Displays Names of people in the household.
                <br />
                3. Summary: Displays Details of selected bill
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. Due Date: Displays the due date of the bill
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b. Amount: The amount due for the bill.
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c. Debtors- Household member attached to the bill
                <br />
                4. Go Back: Takes you back to bills screen
                <br />
                5. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.
                <br />
            </asp:View>
            <asp:View ID="View7" runat="server">
                Figure 6.6<br />
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Content/Images/Figure6.6.png" />
                <br />
                1. New: Button that allows you to enter a new member of household
                <br />
                2. Update: Is an edit button that allows you to edit selected member information.
                <br />
                3. Remove: This button allows you to remove a member from the household.
                <br />
                4. Household Members Box: Displays members of household. When member is highlighted, detailed information pops up on the right pertaining to member.
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a. Name: Display members’ name.<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b. Income: Displays members total income
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c. Debt: Displays total amount member is to pay in household bills
                <br />
                5. Go Back: Takes you back to owner account page.
                <br />
                6. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.
                <br />
            </asp:View>
            <asp:View ID="View8" runat="server">
                Figure 6.7<br />
                <asp:Image ID="Image7" runat="server" ImageUrl="~/Content/Images/Figure6.7.png" />
                <br />
                1. Bill creation Button (new): Creates new bill profile, Enter name of bill, due date, and total amount
                <br />
                2. Bill Name Input Box: Type in bill name into the text box
                <br />
                3. Due Date Calendar Input: Type in due date of bill into text box
                <br />
                4. Total Amount Input Box: Type in total amount of bill that is due
                <br />
                5. Late Amount input Box: Type in the dollar amount of the late fee
                <br />
                6. Update Button: Allows you to update/edit the selected bill information.
                <br />
                7. Remove Button: Allows you to remove/delete the selected bill from the list
                <br />
                8. Bill Display Box: Display selectable and current existing bills
                <br />
                9. Go Back Button: Takes you back to account screen.
                <br />
                10. Exit Page: Exit webpage at any time and closing window by hitting “x” in the upper corner of the browser.
                <br />
            </asp:View>
        </asp:MultiView>
        <br />
        Which page would you like help with?: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
            <asp:ListItem Value="0">Homepage</asp:ListItem>
            <asp:ListItem Value="1">Landing Page</asp:ListItem>
            <asp:ListItem Value="2">Account Register Page</asp:ListItem>
            <asp:ListItem Value="3">Password Recovery Page</asp:ListItem>
            <asp:ListItem Value="4">New Password Page</asp:ListItem>
            <asp:ListItem Value="5">Budget Page</asp:ListItem>
            <asp:ListItem Value="6">Household Page</asp:ListItem>
            <asp:ListItem Value="7">Bills Page</asp:ListItem>
        </asp:DropDownList>
    </form>
    </body>
</html>
