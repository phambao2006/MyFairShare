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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SAVE_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Account a1 = (Account)Session["Accountinfo"];
                double income = Convert.ToDouble(txtBox_Income.Text);//converts household member income to text string

                Member.StoreData(txtBox_Name.Text, income, a1.Id);//stores the income, name, and assigns id to member
                Response.Redirect("HOUSEHOLD.aspx"); //redirect back to Household
            }
        }

        protected void btn_Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btn_PreviousScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("HOUSEHOLD.aspx"); //redirect back to Household
        }
    }
}