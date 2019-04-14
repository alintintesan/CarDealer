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
    class EmployeeDAO : IEmployeeDAO
    {
        public static readonly string SALES_REPRESENTATIVE = "Sales Representative";
        public static readonly string MECHANIC = "Mechanic";
        public static readonly string RENTAL_AGENT = "Rental Agent";

        public List<Employee> GetEmployeesByPosition(string position)
        {
            List<Employee> employees = new List<Employee>();

            using (SqlConnection connection = DatabaseHelper.Instance.GetConnection())
            {
                connection.Open();
                string sql = "select * from Employees where Employees.position = @position";
                SqlCommand command = new SqlCommand(sql, connection);
                command.Parameters.AddWithValue("@position", position);

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    int id = (int)reader["id"];
                    string firstName = (string)reader["firstName"];
                    string lastName = (string)reader["lastName"];
                    string employeePosition = (string)reader["position"];

                    Employee employee = new Employee(id, firstName, lastName, position);

                    employees.Add(employee);
                }
                reader.Close();
            }

            return employees;
        }
    }
}
