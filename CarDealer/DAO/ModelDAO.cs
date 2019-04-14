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
    class ModelDAO : IModelDAO
    {
        public List<Model> GetAllModels()
        {
            List<Model> models = new List<Model>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select Models.id, Brands.brand, Models.brandId, Models.model, Models.basePrice from Models " +
                        "inner join Brands on Models.brandId = Brands.id";
                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int modelId = (int)reader["id"];
                    string brand = (string)reader["brand"];
                    int brandId = (int)reader["brandId"];
                    string model = (string)reader["model"];
                    float basePrice = float.Parse(reader["basePrice"].ToString());

                    Brand brandObj = new Brand(brandId, brand);
                    Model modelObj = new Model(modelId, brandObj, model, basePrice);

                    models.Add(modelObj);
                }
                reader.Close();
            }

            return models;
        }

        public List<Model> GetBrandModels(int brandId)
        {
            List<Model> models = new List<Model>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select Models.id, Brands.brand, Models.brandId, Models.model, Models.basePrice from Models " +
                        "inner join Brands on Models.brandId = Brands.id where Models.brandId = @brandId";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@brandId", brandId);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int modelId = (int)reader["id"];
                    string brand = (string)reader["brand"];
                    int modelBrandId = (int)reader["brandId"];
                    string model = (string)reader["model"];
                    float basePrice = float.Parse(reader["basePrice"].ToString());

                    Brand brandObj = new Brand(brandId, brand);
                    Model modelObj = new Model(modelId, brandObj, model, basePrice);

                    models.Add(modelObj);
                }
                reader.Close();
            }

            return models;
        }

        public Model GetModel(int id)
        {
            Model modelObj = null;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select Models.model, Models.basePrice, Brands.id, Brands.brand from Models " +
                    "inner join Brands on Models.brandId = Brands.id where Models.id = @id";

                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    int brandId = (int)reader["id"];
                    string brand = (string)reader["brand"];
                    string model = (string)reader["model"];
                    float basePrice = float.Parse(reader["basePrice"].ToString());

                    Brand brandObj = new Brand(brandId, brand);
                    modelObj = new Model(id, brandObj, model, basePrice);
                }
                reader.Close();
            }

            return modelObj;
        }
    }
}
