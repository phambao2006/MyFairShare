using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace myFairShare_WebApp
{
    public class Bill
    {
        private int id;
        private string name;
        private DateTime date;
        private double amount;
        private double lateamount;
        private int accountid;
        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public DateTime Date
        {
            get { return date; }
            set { date = value; }
        }
        public double Amount
        {
            get { return amount; }
            set { amount = value; }
        }
        public double Lateamount
        {
            get { return lateamount; }
            set { lateamount = value; }
        }
        public int Accountid
        {
            get { return accountid; }
            set { accountid = value; }
        }

        public static void StoreData(string Name, decimal Amount, DateTime DueDate, decimal LateAmount, int id, decimal balance) // store data into bill table
        {
            string sql = "INSERT INTO Bill (Name,Amount,DueDate,LateAmount,AcctId, Balance) VALUES(@Name, @Amount, @DueDate, @LateAmount, @AcctId, @Balance);";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@Name", Name);//paramerts to be stored in the table. needs to be listed in class for StoreData to function
            Command.Parameters.AddWithValue("@Amount", Amount);
            Command.Parameters.AddWithValue("@DueDate", DueDate);
            Command.Parameters.AddWithValue("@LateAmount", LateAmount);
            Command.Parameters.AddWithValue("@Balance", balance);
            Command.Parameters.AddWithValue("@AcctId", id);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }

        public static void AddPayee(int memberid, int billid) // add payee into the bill
        {
            string sql = "INSERT INTO dbo.Payment (MemberId,BillId) VALUES (@MemberId,@BillId);";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@MemberId", memberid);//paramerts to be stored in the table. needs to be listed in class for StoreData to function
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }
        public static DataSet SelectedMember(int billid) // return dataset of selected member under the bill to the caller
        {
            DataSet data = new DataSet();
            string sql = "SELECT DISTINCT Member.Name AS 'Member', Member.MemberId, Member.Income FROM((dbo.Payment INNER JOIN dbo.Member ON Payment.MemberId = Member.MemberId) INNER JOIN dbo.Bill ON Payment.BillId = Bill.BillId) WHERE Payment.BillId =@Billid; ";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }
        public static DataSet UnSelectedMember(int AcctId, int billid) //return dataset of unselected member under the bill to the caller
        {
            DataSet data = new DataSet(); // make a dataset
            string sql = "SELECT DISTINCT MemberId ,Name FROM dbo.Member WHERE MemberId NOT IN(SELECT DISTINCT Member.MemberId  FROM((dbo.Payment INNER JOIN dbo.Member ON Payment.MemberId = Member.MemberId) INNER JOIN dbo.Bill ON Payment.BillId = Bill.BillId) WHERE Payment.BillId =@Billid) AND AcctId =@AcctId; ";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@AcctId", AcctId);
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter(); 
            adapter.SelectCommand = Command;
            adapter.Fill(data); //execute and add data into dataset
            Command.Connection.Close();
            return data;//return dataset
        }
        public static void RemovePayee(int memberid, int billid) //remove payee under the bill
        {
            string sql = "DELETE FROM dbo.Payment WHERE MemberId=@MemberId AND BillId=@BillId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@MemberId", memberid);//paramerts to be stored in the table. needs to be listed in class for StoreData to function
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }

        public static DataTable GetBill( int billid) // fetch bill info and return to caller
        {
            DataTable data = new DataTable();
            string sql = "SELECT DISTINCT Amount,FORMAT(DueDate, 'MM/dd/yyyy') AS DueDate,LateAmount,Balance, Status, Unpaid FROM dbo.Bill WHERE BillId =@BillId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }
        public static DataTable GetDueBill(int AcctId) // fetch bill info 
        {
            DataTable data = new DataTable();
            string sql = "SELECT [BillId], [Name] FROM [Bill] WHERE (([AcctId] = @AcctId) AND [Balance] > 0.01  AND ([DueDate] >= GETDATE())) ORDER BY [DueDate], [Name];";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@AcctId", AcctId);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }
        public static DataSet UnpaidMember(int billid)  // listed of unpaid member 
        {
            DataSet data = new DataSet();
            string sql = "SELECT DISTINCT Member.Name AS 'Member', Member.MemberId, Member.Income FROM((dbo.Payment INNER JOIN dbo.Member ON Payment.MemberId = Member.MemberId) INNER JOIN dbo.Bill ON Payment.BillId = Bill.BillId) WHERE Payment.BillId =@Billid AND Payment.Paid ='0' ; ";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }

        public static void ResetPayment(int billid) // reset payment for future use
        {
            string sql = "UPDATE dbo.Payment SET Amount='0', LateFee='0' WHERE BillId=@BillId AND Paid ='0';";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }
        public static void UpdateBalance(int billid, double pay) // update balance when someone pay
        {
            string sql = "UPDATE Bill SET Balance = Balance - @paid WHERE BillId=@BillId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Parameters.AddWithValue("@paid", pay);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }
        public static void LateBalance(int billid, double latefee, int unpaid) // update balance when pass duedate
        {
            string sql = "UPDATE Bill SET Balance = Balance + @latefee , Unpaid = @unpaid , Status = 'Late' WHERE BillId=@BillId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Parameters.AddWithValue("@latefee", latefee);
            Command.Parameters.AddWithValue("@unpaid", unpaid);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }

    }
}