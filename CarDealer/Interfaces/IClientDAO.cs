using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IClientDAO
    {
        bool Authenticate(string username, string password, out Client client);
        bool Register(Client client);
        bool UpdateBalance(int id, float newBalance);
        float CheckBalance(int id);
    }
}
