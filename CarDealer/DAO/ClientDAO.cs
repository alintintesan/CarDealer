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
    class ClientDAO : IClientDAO
    {
        public bool Authenticate(string username, string password, out Client client)
        {
            bool isAuthenticated = false;
            client = null;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select * from Clients where Clients.username = @username and Clients.password = @password";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = command.ExecuteReader();
                
                if(reader.Read())
                {
                    isAuthenticated = true;

                    int id = (int)reader["id"];
                    string firstName = (string)reader["firstName"];
                    string lastName = (string)reader["lastName"];
                    string creditCardNo = (string)reader["creditCardNo"];
                    float balance = float.Parse(reader["balance"].ToString());

                    client = new Client(id, username, password, firstName, lastName, creditCardNo, balance);
                }
                
                reader.Close();
            }

            return isAuthenticated;
        }

        public float CheckBalance(int id)
        {
            float balance = 0;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select balance from Clients where Clients.id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    balance = float.Parse(reader["balance"].ToString());
                }
                reader.Close();
            }

            return balance;
        }

        public bool Register(Client client)
        {
            bool success = false;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select * from Clients where Clients.username = @username";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@username", client.Username);

                SqlDataReader reader = command.ExecuteReader();

                if(reader.Read())
                {
                    success = false;
                    reader.Close();
                }
                else
                {
                    reader.Close();
                    sql = "insert into Clients(username, password, firstName, lastName, creditCardNo, balance) output inserted.id" +
                    " values(@username, @password, @firstName, @lastName, @creditCardNo, @balance)";
                    command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@username", client.Username);
                    command.Parameters.AddWithValue("@password", client.Password);
                    command.Parameters.AddWithValue("@firstName", client.FirstName);
                    command.Parameters.AddWithValue("@lastName", client.LastName);
                    command.Parameters.AddWithValue("@creditCardNo", client.CreditCardNo);
                    command.Parameters.AddWithValue("@balance", client.Balance);

                    int insertedId = Convert.ToInt32(command.ExecuteScalar());
                    client.Id = insertedId;
                    success = true;
                }
            }

            return success;
        }

        public bool UpdateBalance(int id, float newBalance)
        {
            int rowsAffected = 0;
            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "update Clients set balance = @balance where id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                command.Parameters.AddWithValue("@balance", newBalance);

                rowsAffected = command.ExecuteNonQuery();
            }

            return rowsAffected > 0;
        }
    }
}
