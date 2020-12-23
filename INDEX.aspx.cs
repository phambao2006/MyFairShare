using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CV_Login_ServerValidate(object source, ServerValidateEventArgs args)
        {
            id = Account.Login(txtBox_Username.Text, txtBox_Password.Text);// Validate login username
            if (id < 0)
                args.IsValid = false;
            else
                args.IsValid = true;

        }
        protected void SIGNUP_Click(object sender, EventArgs e)
        {
            Response.Redirect("REGISTER.aspx"); //redirect back to Login Screen
        }


        protected void SIGNIN_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["Accountinfo"] = new Account(id); // save id for future fetch
                FormsAuthentication.RedirectFromLoginPage(txtBox_Username.Text,true); // secure login 
            }
        }

        protected void btnGuess_Click(object sender, EventArgs e)
        {
            Session["Accountinfo"] = new Account(2); // save id for future fetch
            FormsAuthentication.RedirectFromLoginPage(txtBox_Username.Text, true); // secure login 
        }
    }
}