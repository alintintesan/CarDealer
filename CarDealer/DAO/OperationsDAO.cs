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
    class OperationsDAO : IOperationsDAO
    {
        public List<Operation> GetAllOperations()
        {
            List<Operation> operations = new List<Operation>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Operations";
                SqlCommand command = new SqlCommand(sql, connection);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int operationId = (int)reader["id"];
                    string operation = (string)reader["operation"];
                    float cost = float.Parse(reader["cost"].ToString());

                    Operation operationObj = new Operation(operationId, operation,cost);
                    operations.Add(operationObj);
                }
                reader.Close();
            }
            return operations;
        }

        public Operation GetOperation(int id)
        {
            Operation operationObj = null;

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                string sql = "select * from Operations where id = @id";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@id", id);
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    string operation = (string)reader["operation"];
                    float cost = float.Parse(reader["cost"].ToString());

                    operationObj = new Operation(id, operation, cost);
                }
                reader.Close();
            }
            return operationObj;
        }
    }
}
