﻿using CarDealer.Enums;
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
                string sql = "select * from Option";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = (int)reader["price"];
                    string level = (string)reader["level"];

                    EOptionsLevel eLevel = EOptionsLevel.Basic; // TODO AH: error handling for non-existent types?

                    switch(level)
                    {
                        case "entry":
                            eLevel = EOptionsLevel.Entry;
                            break;
                        case "premium":
                            eLevel = EOptionsLevel.Premium;
                            break;
                        case "luxury":
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
                string sql = "select id, option, price from Option where level = 'entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = (int)reader["price"];

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
                string sql = "select id, option, price from Option where level = 'premium'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = (int)reader["price"];

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
                string sql = "select id, option, price from Option where level = 'entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int optionId = (int)reader["id"];
                    string option = (string)reader["option"];
                    float price = (int)reader["price"];

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
                string sql = "select price from Option where level = 'entry'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = reader.GetFloat(0);
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
                string sql = "select price from Option where level = 'premium'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = reader.GetFloat(0);
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
                string sql = "select price from Option where level = 'luxury'";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    price = reader.GetFloat(0);
                }

                reader.Close();
            }

            return price;
        }

    }
}
