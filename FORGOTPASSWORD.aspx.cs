using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("INDEX.aspx"); //redirect back to Login Screen
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            string answer1 = (string) ViewState["Answer1"]; // answer1 from user
            string answer2 = (string)ViewState["Answer2"]; // answer 2 from user
            if (txtBox_Answer1.Text == answer1 && txtBox_Answer2.Text == answer2)
            {
                Session["Username"] = txtBox_Username.Text; // store username 
                Response.Redirect("NEWPASSWORD.aspx"); //redirect back to Login Screen, but also registers user input
            }
            else 
            {
                Label1.Text = "Incorect Answer";
            }
        }

        protected void txtBox_Username_TextChanged(object sender, EventArgs e)
        {
            DataTable data = Account.VerifyAccount(txtBox_Username.Text); // verify user and answers
            dropbox_SecurityQuestion1.SelectedIndex = Convert.ToInt32(data.Rows[0]["Question1"]);
            dropbox_SecurityQuestion2.SelectedIndex = Convert.ToInt32(data.Rows[0]["Question2"]);
            ViewState["Answer1"] = data.Rows[0]["Answer1"];
            ViewState["Answer2"] = data.Rows[0]["Answer2"];
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Account.UsernameisTaken(txtBox_Username.Text))
                args.IsValid = true; 
            else
                args.IsValid = false; 
        }
    }
}