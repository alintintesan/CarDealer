using CarDealer.Enums;
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
    class CarInventoryDAO : ICarInventoryDAO
    {
        public List<CarInventory> GetAllCars()
        {
            List<CarInventory> cars = new List<CarInventory>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select * from CarsInventory";
                SqlCommand command = new SqlCommand(sql, connection);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = (int)reader["id"];
                    int modelId = (int)reader["modelId"];
                    int colorId = (int)reader["colorId"];
                    DateTime buildDate = (DateTime)reader["buildDate"];
                    int mileage = (int)reader["mileage"];
                    float initialPrice = float.Parse(reader["initialPrice"].ToString());
                    float finalPrice = float.Parse(reader["finalPrice"].ToString());
                    string optionsLevel = (string)reader["optionsLevel"];
                    int engineId = (int)reader["engineId"];

                    IModelDAO modelDAO = new ModelDAO();
                    Model model = modelDAO.GetModel(modelId);

                    IColorDAO colorDAO = new ColorDAO();
                    Color color = colorDAO.GetColor(colorId);

                    IEngineDAO engineDAO = new EngineDAO();
                    Engine engine = engineDAO.GetEngine(engineId);

                    CarInventory car = new CarInventory(id, model, color, engine, buildDate, mileage, initialPrice);

                    EOptionsLevel eLevel = EOptionsLevel.Basic;

                    switch (optionsLevel)
                    {
                        case "basic":
                            eLevel = EOptionsLevel.Luxury;
                            break;
                        case "Entry":
                            eLevel = EOptionsLevel.Entry;
                            break;
                        case "Premium":
                            eLevel = EOptionsLevel.Premium;
                            break;
                        case "Luxury":
                            eLevel = EOptionsLevel.Luxury;
                            break;
                    }

                    IOptionDAO optionDAO = new OptionDAO();
                    List<Option> options = optionDAO.GetLevelOptions(eLevel);

                    car.OptionsLevel = eLevel;
                    car.Options = options;
                    car.FinalPrice = finalPrice;

                    cars.Add(car);
                }
                reader.Close();
            }
            return cars;
        }

        public List<CarInventory> GetCarsForRent()
        {
            List<CarInventory> allCars = GetAllCars();
            List<CarInventory> carsForRent = allCars.Where(car => car.Mileage > 0).ToList();
            return carsForRent;
        }

        public void TestDrive(int id, int distance)
        {
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "update CarsInventory set mileage = mileage + @distance where id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@distance", distance);
                command.Parameters.AddWithValue("@id", id);

                command.ExecuteNonQuery();
            }
        }
    }
}
