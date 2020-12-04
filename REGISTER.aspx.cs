using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("INDEX.aspx"); //redirect back to Login Screen
        }
        protected void CVUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (Account.UsernameisTaken(txtBox_Username.Text)) // check if username is taken
                args.IsValid = false; // validation fail because username is taken
            else
                args.IsValid = true; // pass validation
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args) //custom validator for checkmark box
        {
            args.IsValid = CheckBox1.Checked; //checks if box is checked
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // if all validator is good then
            {
                Account.StoreData(txtBox_Username.Text, txtBox_Password.Text, dropbox_SecurityQuestion1.SelectedValue, txtBox_Answer1.Text, dropbox_SecurityQuestion2.SelectedValue, txtBox_Answer2.Text); // store account info to database
                Response.Redirect("INDEX.aspx");
            }
        }

    }
}