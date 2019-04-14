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
        private ICarInventoryDAO carInventoryDAO;
        private IColorDAO colorDAO;

        public MainMenu()
        {
            clientDAO = new ClientDAO();
            carInventoryDAO = new CarInventoryDAO();
            colorDAO = new ColorDAO();
        }

        public bool Authenticate(string username, string password, out Client client)
        {
            return clientDAO.Authenticate(username, password, out client);
        }

        public bool Register(Client client)
        {
            return clientDAO.Register(client);
        }

        public List<CarInventory> GetAllCars()
        {
            return carInventoryDAO.GetAllCars();
        }

        public float CheckClientBalance(Client client)
        {
            return clientDAO.CheckBalance(client.Id);
        }

        public bool UpdateClientBalance(Client client, float newBalance)
        {
            return clientDAO.UpdateBalance(client.Id, newBalance);
        }

        public List<Color> GetAllColors()
        {
            return colorDAO.GetAllColors();
        }
    }
}
