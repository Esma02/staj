using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Xml;

namespace webServiceDeneme
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class sorgu : System.Web.Services.WebService
    {
        private string connectionString = "Server=LAPTOP-B8MFA7LK;Database=staj-2;Integrated Security=True;";

        [WebMethod]
        public DataSet tümilceler()
        {
            DataSet ds = new DataSet();
            string query = "SELECT * FROM il_ilceler"; 

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn))
                {
                    try
                    {
                        conn.Open();
                        adapter.Fill(ds);
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Veri çekme hatası: " + ex.Message);
                    }
                }
            }
            return ds;
        }

        [WebMethod]
        public DataSet idyegöre(int id)
        {
            DataSet ds = new DataSet();
            string query = "SELECT * FROM il_ilceler WHERE Id = @Id"; 

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn))
                {
                    adapter.SelectCommand.Parameters.AddWithValue("@Id", id);
                    try
                    {
                        conn.Open();
                        adapter.Fill(ds);
                    }
                    catch (Exception ex)
                    {
                        throw new Exception("Veri çekme hatası: " + ex.Message);
                    }
                }
            }
            return ds;
        }


    }
}


