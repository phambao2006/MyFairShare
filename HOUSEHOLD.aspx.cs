using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {//keeps the users account session for the page
            Account a1 = (Account)Session["Accountinfo"];
            SqlDataSourceMember.SelectParameters["AcctId"].DefaultValue = Convert.ToString(a1.Id);
        }


        protected void GO_BACK_Click(object sender, EventArgs e)
        {
            Response.Redirect("BUDGET.aspx");//takes user to budget page
        }

        protected void btnNewMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("HOUSEHOLD_NEW_MEMADD.aspx");//takes user to add members to their household
        }

        protected void btn_Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }
    }
}