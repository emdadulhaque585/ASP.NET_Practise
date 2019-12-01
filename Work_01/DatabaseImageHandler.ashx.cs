using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
namespace Work_01
{
    /// <summary>
    /// Summary description for DatabaseImageHandler
    /// </summary>
    public class DatabaseImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string id = context.Request.QueryString["id"];
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TESTDB"].ConnectionString);
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}