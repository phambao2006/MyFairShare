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
     public static  SqlConnection connection = new SqlConnection("Server=198.71.226.2;Database=myfairshares;User id=phambao2006;Password=Cubinti2007!");

    }
}