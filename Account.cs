using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace myFairShare_WebApp
{
    public class Account
    {
        private int id;
        private string username;
        private string password;
        private string question1;
        private string answer1;
        private string question2;
        private string answer2;
        public Account(int id)
        {
            this.Id = id;
        }
        public int Id
        {
            get {return id;}
            set {id = value;}
        }
        public string Username
        {
            get { return username; }
            set { username = value; }
        }
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        public string Question1
        {
            get { return question1; }
            set { question1 = value; }
        }
        public string Answer1
        {
            get { return answer1; }
            set { answer1 = value; }
        }
        public string Question2
        {
            get { return question2; }
            set { question2 = value; }
        }
        public string Answer2
        {
            get { return answer2; }
            set { answer2 = value; }
        }


         public static Boolean UsernameisTaken(string username)
         {
            bool Usernameistaken; 
            string sql = "SELECT Username FROM Account WHERE Username =@Username ; ";
            SqlCommand Command = new SqlCommand(sql, Client.connection);
            Command.Parameters.AddWithValue("@Username", username);
            Command.Connection.Open();
            using (SqlDataReader dbReader = Command.ExecuteReader())
            {
                if (dbReader.HasRows)
                    Usernameistaken = true;
                else
                    Usernameistaken = false;
                Command.Connection.Close();
            }
            return Usernameistaken;
         }


        public static void StoreData(string username, string password, string question1, string answer1,string question2, string answer2)
        {
            string sql = "INSERT INTO Account (Username,Password,Question1,Answer1,Question2,Answer2) VALUES(@Username, @Password, @Question1,@Answer1, @Question2,@Answer2);";
            SqlCommand Command = new SqlCommand(sql, Client.connection);
            Command.Parameters.AddWithValue("@Username", username);
            Command.Parameters.AddWithValue("@Password", password);
            Command.Parameters.AddWithValue("@Question1", question1);
            Command.Parameters.AddWithValue("@Answer1", answer1);
            Command.Parameters.AddWithValue("@Question2", question2);
            Command.Parameters.AddWithValue("@Answer2", answer2);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }


        public static int Login(string username, string password)
        {
            int id = -1;
            string sql = "SELECT AcctId FROM Account WHERE Username =@Username AND Password =@Password ; ";
            SqlCommand Command = new SqlCommand(sql, Client.connection);
            Command.Parameters.AddWithValue("@Username", username);
            Command.Parameters.AddWithValue("@Password", password);
            Command.Connection.Open();
            using (SqlDataReader dbReader = Command.ExecuteReader())
            {
                if (dbReader.HasRows)
                {
                    if (dbReader.Read())
                        id = Convert.ToInt32(dbReader.GetValue(0));
                }

            }
            Command.Connection.Close();
            return id;
        }

        public static DataTable VerifyAccount(string username)
        {
            DataTable data = new DataTable();
            string sql = "SELECT AcctId,Question1,Answer1,Question2,Answer2 FROM Account WHERE Username =@Username;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);//establishes sql connection
            Command.Parameters.AddWithValue("@Username", username);
            Command.Connection.Open();
            SqlDataAdapter adapter = new SqlDataAdapter();
            adapter.SelectCommand = Command;
            adapter.Fill(data);
            Command.Connection.Close();
            return data;
        }

        public static void Resetpassword(string username, string password)
        {
            string sql = "UPDATE Account SET Password=@Password WHERE  Username=@Username;";
            SqlCommand Command = new SqlCommand(sql, Client.connection);
            Command.Parameters.AddWithValue("@Username", username);
            Command.Parameters.AddWithValue("@Password", password);
            Command.Connection.Open();
            Command.ExecuteNonQuery();
            Command.Connection.Close();
        }


    }
}