using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void SAVE_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Account a1 = (Account)Session["Accountinfo"];//establishes account session?
                decimal amount = Convert.ToDecimal(txtBox_DueAmount.Text);//converts user input to text string
                DateTime date = Convert.ToDateTime(txtBox_DueDate.Text);//converts user input to text string
                decimal late = 0 ;
                if (txtLate.Text == "")
                    late = amount;
                else
                    late = Convert.ToDecimal(txtLate.Text);
                Bill.StoreData(txtBox_Name.Text, amount, date, late, a1.Id, amount);//stores the data to bill tables on click
                Response.Redirect("BILLS.aspx");//redirects to bill page on click
            }
        }

        protected void btn_Logout(object sender, EventArgs e)// log out
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btn_PreviousScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("BILLS.aspx"); //redirect back to Household
        }
    }
}