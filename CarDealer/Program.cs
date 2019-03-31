using CarDealer.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer
{
    class Program
    {
        static void Main(string[] args)
        {
            MessageHelper.Print(MessageHelper.MSG_HELLO);
            MessageHelper.Format(MessageHelper.MSG_HELLO_NAME, "World");

            SqlConnection connection = DatabaseHelper.Instance.GetConnection();
            try
            {
                connection.Open();
                string sql = @"select * from [Users]";
                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    MessageHelper.Format("{0} {1} {2} ", reader.GetValue(0), reader.GetValue(1), reader.GetValue(2));
                }
                reader.Close();
                command.Dispose();
                connection.Close();
            }
            catch (Exception e)
            {
                MessageHelper.Format("Cannot open connection ", e);
            }
        }
    }
}
