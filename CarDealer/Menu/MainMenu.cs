using CarDealer.DAO;
using CarDealer.Interfaces;
using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Menu
{
    class MainMenu : IMainMenu
    {
        private IClientDAO clientDAO;

        public MainMenu()
        {
            clientDAO = new ClientDAO();
        }

        public bool authenticate(string username, string password, out Client client)
        {
            return clientDAO.Authenticate(username, password, out client);
        }

        public bool register(Client client)
        {
            return clientDAO.Register(client);
        }
    }
}
