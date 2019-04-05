using CarDealer.Models;
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
            MessageHelper.Print(MessageHelper.MSG_HELLO_NAME, "World");

            SqlConnection connection = DatabaseHelper.Instance.GetConnection();
            try
            {
                connection.Open();
                string sql = "select Models.id, Brands.brand, Models.brandId, Models.model, Models.basePrice from Models " +
                    "inner join Brands on Models.brandId = Brands.id";
                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader();

                List<Model> models = new List<Model>();

                while (reader.Read())
                {
                    int modelId = (int)reader.GetValue(0);
                    string brand = (string)reader.GetValue(1);
                    int brandId = (int)reader.GetValue(2);
                    string model = (string)reader.GetValue(3);
                    float basePrice = (float)reader.GetValue(4);

                    Brand brandObj = new Brand(brandId, brand);
                    Model modelObj = new Model(modelId, brandObj, model, basePrice);

                    models.Add(modelObj);
                }
                reader.Close();
                command.Dispose();
                connection.Close();

                foreach(var model in models)
                {
                    MessageHelper.Print(model.ToString());
                }
            }
            catch (Exception e)
            {
                MessageHelper.Print("Cannot open connection ", e);
            }
        }
    }
}
