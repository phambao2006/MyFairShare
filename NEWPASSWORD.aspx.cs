using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("INDEX.aspx"); //redirect back to Login Screen
        }

        protected void Confirm_Click(object sender, EventArgs e)
        {
            string username = (string)Session["Username"];
            if (!string.IsNullOrEmpty(username))
            {
                Account.Resetpassword(username, txtBox_Password.Text);
                Response.Redirect("INDEX.aspx"); //redirect back to Login Screen, but also registers user input
            }
            else 
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('ILLEGAL TRESPASSING CONTACT SUPPORT FOR MORE DETAILS')", true); // alert for tresspassing without answer security question
            }
        }
    }
}