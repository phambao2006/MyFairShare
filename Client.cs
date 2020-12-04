using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace myFairShare_WebApp
{
    public class Client
    {
        //this is the sqlconnection Bao made to make things easy
     public static  SqlConnection connection = new SqlConnection("Server=myfairshare.mssql.somee.com;Database=myfairshare;User id=phambao2006_SQLLogin_1;Password=z1nrqyw6sj");

    }
}