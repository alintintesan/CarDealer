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
    class EngineDAO : IEngineDAO
    {
        public Engine GetEngine(int id)
        {
            Engine engineObj = null;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Engines where id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string fuelType = (string)reader["fuelType"];
                    int power = (int)reader["power"];
                    string capacity = (string)reader["capacity"];

                    engineObj = new Engine(id, fuelType, power, capacity);
                }
                reader.Close();
            }
            return engineObj;
        }

        public List<Engine> GetEnginesForModel(int modelId)
        {
            List<Engine> engines = new List<Engine>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select Engines.id, Engines.power, Engines.capacity, Engines.fuelType from Engines " +
                    "inner join ModelEngines on Engines.id = ModelEngines.engineId where ModelEngines.modelId = @modelId";

                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@modelId", modelId);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = (int)reader["id"];
                    string fuelType = (string)reader["fuelType"];
                    int power = (int)reader["power"];
                    string capacity = (string)reader["capacity"];

                    Engine engine = new Engine(id, fuelType, power, capacity);
                    engines.Add(engine);
                }
                reader.Close();
            }
            return engines;
        }
    }
}
