using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //needs to be first in order for pages to load, do not put anything before this method
            if (!IsPostBack)
            {
                Account a1 = (Account)Session["Accountinfo"];
                SqlDataSource1.SelectParameters["AcctId"].DefaultValue = Convert.ToString(a1.Id);
                lbSelectedMember.DataTextField = "Member";
                lbSelectedMember.DataValueField = "Memberid";
            }
        }

        protected void BILLS_Click(object sender, EventArgs e)
        {
            Response.Redirect("BILLS.aspx"); //Directs to BILL Page on Button click
        }

        protected void HOUSEHOLD_Click(object sender, EventArgs e)
        {
            //Procesing Logic of button click event
            Response.Redirect("HOUSEHOLD.aspx"); //directs to Household page on button click
        }

        protected void SUMMARY_Click(object sender, EventArgs e)
        {

        }

        protected void GOBACK_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void lb_bills_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBox_DueDate.Text = "";
            txtBox_Amount.Text = "";
            txtLateFee.Text = "";
            txtTotal.Text = "";
            double total = 0;
            DataSet data = Bill.SelectedMember(Convert.ToInt32(lb_bills.SelectedValue));
            int member = data.Tables[0].Rows.Count;
            for (int i = 0; i < member; i++)
            {
                total += Convert.ToDouble(data.Tables[0].Rows[i]["Income"]);
            }
            data = Bill.UnpaidMember(Convert.ToInt32(lb_bills.SelectedValue));
            lbSelectedMember.DataSource = data;
            lbSelectedMember.DataBind();
            ViewState["total"] = total;
        }

        protected void lbSelectedMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable paymentinfo = Member.GetPayment(Convert.ToInt32(lb_bills.SelectedValue), Convert.ToInt32(lbSelectedMember.SelectedValue));
            DataTable data = Bill.GetBill(Convert.ToInt32(lb_bills.SelectedValue));
            double billamount = Convert.ToDouble(data.Rows[0]["Amount"]);
            double amount = Convert.ToDouble(paymentinfo.Rows[0]["Amount"]);
            double latefee = Convert.ToDouble(paymentinfo.Rows[0]["LateFee"]);
            string status = Convert.ToString(data.Rows[0]["Status"]);
            int count = Convert.ToInt32(data.Rows[0]["Unpaid"]);

             double totalincome = (double)ViewState["total"];
             double income = Member.Getincome(Convert.ToInt32(lbSelectedMember.SelectedValue));
             amount = (income / totalincome) * billamount;

            string duedate = Convert.ToString(data.Rows[0]["DueDate"]);
            DateTime dt1 = DateTime.Parse(duedate);
            DateTime dt2 = DateTime.Now;

            if (dt1.Date < dt2.Date && lbSelectedMember.Items.Count != 0)
            {
                latefee = Convert.ToDouble(data.Rows[0]["LateAmount"]);
                if (status != "Late")
                {
                    count = lbSelectedMember.Items.Count;
                    Bill.LateBalance(Convert.ToInt32(lb_bills.SelectedValue), (latefee - billamount), count);
                }

                latefee = (latefee - billamount) / count;
            }
            Member.UpdatePayment(Convert.ToInt32(lbSelectedMember.SelectedValue), Convert.ToInt32(lb_bills.SelectedValue), amount, latefee);
            double total = amount + latefee;
            txtBox_DueDate.Text = duedate;
            txtBox_Amount.Text = amount.ToString("F");
            txtLateFee.Text = latefee.ToString("F");
            txtTotal.Text = total.ToString("F");

        }

        protected void lb_bills_PreRender(object sender, EventArgs e)
        {

            int num = 0;
            if (ViewState["num"] != null)
            {
                num = (int)ViewState["num"];
            }
            if (!IsPostBack)
            {
                num = lb_bills.Items.Count;
                ViewState["num"] = num;
            }
            for (int i = 0; i < num; i++)
            {
                lb_bills.Items[i].Attributes.CssStyle.Add("background-color", "#FFB6C1");
            }
            if (!IsPostBack)
            {

                Account a1 = (Account)Session["Accountinfo"];
                DataTable data = Bill.GetDueBill(a1.Id);
                int num1 = data.Rows.Count;
                for (int i = 0; i < num1; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = Convert.ToString(data.Rows[i]["Name"]);
                    item.Value = Convert.ToString(data.Rows[i]["BillId"]);
                    lb_bills.Items.Add(item);
                }

            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            if (lb_bills.SelectedValue != "" && txtBox_Amount.Text != "" && lbSelectedMember.SelectedValue != "") 
            {
                Bill.UpdateBalance(Convert.ToInt32(lb_bills.SelectedValue), Convert.ToDouble(txtTotal.Text));
                Member.Paid(Convert.ToInt32(lb_bills.SelectedValue), Convert.ToInt32(lbSelectedMember.SelectedValue));
                lb_bills_SelectedIndexChanged(Button1, EventArgs.Empty);
            }
            if (lbSelectedMember.Items.Count == 0) 
            {
                Page.Response.Redirect(Page.Request.Url.ToString(), false);
            }
        }
    }
}