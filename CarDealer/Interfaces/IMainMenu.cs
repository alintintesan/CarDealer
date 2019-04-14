using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IMainMenu
    {
        bool Authenticate(string username, string password, out Client client);
        bool Register(Client client);
        List<CarInventory> GetAllCars();
        float CheckClientBalance(Client client);
        bool UpdateClientBalance(Client client, float newBalance);
        List<Color> GetAllColors();
        void TestDrive(CarInventory car, int distance);
        List<CarInventory> GetCarsForRent();
        List<Operation> GetAllOperation();
        List<Brand> GetAllBrands();
        List<Model> GetBrandModels(Brand brand);
        float GetModelBasePrice(int id);
    }
}
