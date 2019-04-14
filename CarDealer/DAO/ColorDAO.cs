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
    class ColorDAO : IColorDAO
    {
        public List<Color> GetAllColors()
        {
            List<Color> colors = new List<Color>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Colors";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int colorId = (int)reader["id"];
                    string color = (string)reader["color"];

                    Color colorObj = new Color(colorId, color);
                    colors.Add(colorObj);
                }
                reader.Close();
            }
            return colors;
        }

        public Color GetColor(int id)
        {
            Color colorObj = null;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Colors where id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string color = (string)reader["color"];

                    colorObj = new Color(id, color);
                }
                reader.Close();
            }
            return colorObj;
        }
    }
}
