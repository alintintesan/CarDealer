using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace CarDealer.Utils
{
    class DatabaseHelper // MUST MODIFY HERE (SINGLETON)
    {
        private readonly string CONNECTION_STRING = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

        private static readonly Object padlock = new Object();
        private static DatabaseHelper instance;
        // private SqlConnection connection;

        private DatabaseHelper() { }

        public static DatabaseHelper Instance
        {
            get
            {
                if (instance == null)
                {
                    lock (padlock)
                    {
                        instance = new DatabaseHelper();

                    }
                }
                return instance;
            }
        }

        public SqlConnection GetConnection()
        {
            return new SqlConnection(CONNECTION_STRING);
        }
    }
}
