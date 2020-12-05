using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account a1 = (Account)Session["Accountinfo"];
            SqlDataSourceBills.SelectParameters["AcctId"].DefaultValue = Convert.ToString(a1.Id);
        }

        protected void GOBACK__Click(object sender, EventArgs e)
        {
            Response.Redirect("BUDGET.aspx");//takes user back to budget page
        }

        protected void btn_CreateBill_Click(object sender, EventArgs e)
        {
            Response.Redirect("BILLS_NEW_MEADD.aspx");//takes user to create a bill page
        }

        protected void txtBox_Name_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddPayee.aspx"); //takes user back to AddPayee page
        }

        protected void Button3_Click(object sender, EventArgs e) // ????
        {

        }

        protected void btn_Logout_Click(object sender, EventArgs e)// sign out
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}
