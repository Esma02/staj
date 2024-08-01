using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourNamespace
{
    public partial class CustomerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int customerId = Convert.ToInt32(Request.QueryString["id"]);

                // Müşteri bilgilerini yükle
                LoadCustomerDetails(customerId);

                // Müşteri siparişlerini yükle
                LoadCustomerOrders(customerId);
            }
        }

        private void LoadCustomerDetails(int customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KRSConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT FirstName, LastName, Email FROM Customers WHERE CustomerID = @CustomerID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customerId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        txtFirstName.Text = reader["FirstName"].ToString();
                        txtLastName.Text = reader["LastName"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                    }
                    connection.Close();
                }
            }
        }

        private void LoadCustomerOrders(int customerId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["KRSConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT OrderDate, Amount, Description FROM Orders WHERE CustomerID = @CustomerID";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customerId);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable orders = new DataTable();
                    adapter.Fill(orders);
                    gvOrders.DataSource = orders;
                    gvOrders.DataBind();
                }
            }
        }

        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            int customerId = Convert.ToInt32(Request.QueryString["id"]);
            string orderDate = txtOrderDate.Text;
            decimal amount = Convert.ToDecimal(txtOrderAmount.Text);
            string description = txtOrderDescription.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["KRSConnectionString"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Orders (CustomerID, OrderDate, Amount, Description) VALUES (@CustomerID, @OrderDate, @Amount, @Description)";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerID", customerId);
                    command.Parameters.AddWithValue("@OrderDate", orderDate);
                    command.Parameters.AddWithValue("@Amount", amount);
                    command.Parameters.AddWithValue("@Description", description);

                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }

            // Siparişler yeniden yüklenir
            LoadCustomerOrders(customerId);
        }
    }
}
