using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class AddPayee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)// if page post back dont do this
            {
                lbSelectedMember.DataTextField = "Member";
                lbSelectedMember.DataValueField = "Memberid";
                lbMembers.DataTextField = "Name";
                lbMembers.DataValueField = "Memberid";
                Account a1 = (Account)Session["Accountinfo"];
                SqlDataSourceBills.SelectParameters["AcctId"].DefaultValue = Convert.ToString(a1.Id);
            }

        }

        protected void Button1_Click(object sender, EventArgs e)  // Click Add event
        {
            if (lbMembers.SelectedValue != "")
            {
                Bill.AddPayee(Convert.ToInt32(lbMembers.SelectedValue), Convert.ToInt32(lbBills.SelectedValue)); // add payee under the bill
                lbBills_SelectedIndexChanged(Button1, EventArgs.Empty); // empty event helps rerendered
            }
        }

        protected void lbBills_SelectedIndexChanged(object sender, EventArgs e) 
        {
            Account a1 = (Account)Session["Accountinfo"];

            lbSelectedMember.DataSource = Bill.SelectedMember(Convert.ToInt32(lbBills.SelectedValue)); // fetch data and bind it to selectmember listbox
            lbSelectedMember.DataBind();
            lbMembers.DataSource = Bill.UnSelectedMember(a1.Id, Convert.ToInt32(lbBills.SelectedValue));// fetch data and bind it to unselectmember listbox
            lbMembers.DataBind();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (lbSelectedMember.SelectedValue != "")
            {
                Bill.RemovePayee(Convert.ToInt32(lbSelectedMember.SelectedValue), Convert.ToInt32(lbBills.SelectedValue)); // remove payee from the bill
                lbBills_SelectedIndexChanged(Button1, EventArgs.Empty);
            }
        }

        protected void btn_Logout(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut(); // sign out the page 
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void btn_Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("BILLS.aspx"); //redirect back to Household
        }
    }
}