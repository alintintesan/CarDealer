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
    class OptionDAO : IOptionDAO
    {
        public List<Option> GetAllOptions()
        {
            List<Option> options = new List<Option>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Options";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = float.Parse(reader["price"].ToString());
                    string level = (string)reader["level"];

                    EOptionsLevel eLevel = EOptionsLevel.Basic;

                    switch(level)
                    {
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

                    Option optionObj = new Option(optionId, option, price, eLevel);

                    options.Add(optionObj);
                }
                reader.Close();
            }

            return options;
        }

        public List<Option> GetEntryOptions()
        {
            List<Option> options = new List<Option>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select id, [option], price from Options where level = 'Entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = float.Parse(reader["price"].ToString());

                    Option optionObj = new Option(optionId, option, price, EOptionsLevel.Entry);

                    options.Add(optionObj);
                }
                reader.Close();
            }

            return options;
        }

        public List<Option> GetPremiumOptions()
        {
            List<Option> options = new List<Option>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select id, [option], price from Options where level = 'Premium'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = (float)reader["price"];

                    Option optionObj = new Option(optionId, option, price, EOptionsLevel.Premium);

                    options.Add(optionObj);
                }
                reader.Close();
            }

            return options;
        }

        public List<Option> GetLuxuryOptions()
        {
            List<Option> options = new List<Option>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select id, [option], price from Options where level = 'Entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = float.Parse(reader["price"].ToString());

                    Option optionObj = new Option(optionId, option, price, EOptionsLevel.Luxury);

                    options.Add(optionObj);
                }
                reader.Close();
            }

            return options;
        }

        public float GetEntryCost()
        {
            float price = 0;
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select price from Options where level = 'Entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = float.Parse(reader["price"].ToString());
                }

                reader.Close();
            }

            return price;
        }

        public float GetPremiumCost()
        {
            float price = 0;
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select price from Options where level = 'Premium'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = float.Parse(reader["price"].ToString());
                }

                reader.Close();
            }

            return price;
        }
    
        public float GetLuxuryCost()
        {
            float price = 0;
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select price from Options where level = 'Luxury'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = float.Parse(reader["price"].ToString());
                }

                reader.Close();
            }

            return price;
        }

        public List<Option> GetLevelOptions(EOptionsLevel level)
        {
            List<Option> options = new List<Option>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select id, [option], price from Options where level = '@level'";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@level", level.ToString());
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = float.Parse(reader["price"].ToString());

                    Option optionObj = new Option(optionId, option, price, level);

                    options.Add(optionObj);
                }
                reader.Close();
            }

            return options;
        }
        
        public float GetLevelCost(EOptionsLevel level)
        {
            float price = 0;
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select price from Options where level = '@level'";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@level", level.ToString());
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price += float.Parse(reader["price"].ToString());
                }

                reader.Close();
            }

            return price;
        }

    }
}
