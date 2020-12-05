using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace myFairShare_WebApp
{
    public class Member
    {
        private int id;
        private string name;
        private double income;
        private double remainder;
        private int accountid;
        public int Id
        {
            get { return id; }
            set { id = value ; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public double Income
        {
            get { return income; }
            set { income = value; }
        }
        public double Remainder
        {
            get { return remainder; }
            set { remainder = value; }
        }
        public int Accountid
        {
            get { return accountid; }
            set { accountid = value; }
        }


        public static void StoreData(string name,double income,int id) // insert data into member table
        {//needed for the StoreData function to operate on webpages
            string sql = "INSERT INTO Member (Name,Income,AcctId) VALUES(@Name, @Income, @AcctId);";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@Name", name);//parameters for household members. 
            Command.Parameters.AddWithValue("@Income", income);
            Command.Parameters.AddWithValue("@AcctId", id);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }

        public static double Getincome(int memberid) // fetch income of a members
        {
            double income = 0 ;
            string sql = "SELECT DISTINCT Member.Income FROM dbo.Member WHERE Memberid =@MemberId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);
            Command.Parameters.AddWithValue("@MemberId", memberid);
            Command.Connection.Open();
            using (SqlDataReader dbReader = Command.ExecuteReader())
            {
                if (dbReader.HasRows)
                {
                    if (dbReader.Read())
                        income = Convert.ToDouble(dbReader.GetValue(0));
                }

            }
            Command.Connection.Close();
            return income;
        }
        public static void UpdatePayment(int memberid, int billid, double amount, double latefee) // update payment for each user
        {
            string sql = "UPDATE dbo.Payment SET Amount=@Amount,LateFee=@LateFee WHERE BillId=@BillId AND MemberId=@MemberId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@MemberId", memberid);//paramerts to be stored in the table. needs to be listed in class for StoreData to function
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Parameters.AddWithValue("@Amount", amount);
            Command.Parameters.AddWithValue("@LateFee", latefee);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }
        public static DataTable GetPayment(int BillId, int MemberId) // return amount and late amount of a member
        {
            DataTable data = new DataTable();
            string sql = "SELECT Amount,LateFee FROM dbo.Payment WHERE BillId=@BillId AND MemberId=@MemberId;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", BillId);
            Command.Parameters.AddWithValue("@MemberId", MemberId);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }
        public static void Paid(int billid, int memberid) // set members status to paid 
        {
            string sql = "UPDATE Payment SET Paid ='1' WHERE  BillId=@BillId AND MemberId=@MemberId ;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@BillId", billid);
            Command.Parameters.AddWithValue("@MemberId", memberid);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }

    }
}