using CarDealer.Interfaces;
using CarDealer.Models;
using CarDealer.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.DAO
{
    class BrandDAO : IBrandDAO
    {
        public List<Brand> GetAllBrands()
        {
            List<Brand> brands = new List<Brand>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select * from Brands";
                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = (int)reader["id"];
                    string brand = (string)reader["brand"];

                    Brand brandObj = new Brand(id, brand);
                    brands.Add(brandObj);
                }
                reader.Close();
            }

            return brands;
        }
    }
}
