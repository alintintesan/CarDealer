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
    class DealDAO : IDealDAO
    {
        public List<Deal> GetAllDeals()
        {
            List<Deal> deals = new List<Deal>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select Deals.id, Deals.discountedPrice, Brands.brand, Models.model from Deals " +
                    "inner join CarsInventory on Deals.carId = CarsInventory.id inner join Models " +
                    "on Models.id = CarsInventory.modelId inner join Brands on Brands.id = Models.brandId";
                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader reader = command.ExecuteReader();

                while(reader.Read())
                {
                    int id = (int)reader["id"];
                    float discountedPrice = float.Parse(reader["discountedPrice"].ToString());
                    string brand = (string)reader["brand"];
                    string model = (string)reader["model"];

                    Deal deal = new Deal();
                    deal.Id = id;
                    deal.CarBrand = brand;
                    deal.CarModel = model;
                    deal.DiscountedPrice = discountedPrice;

                    deals.Add(deal);
                }
                reader.Close();
            }
            return deals;
        }
    }
}
