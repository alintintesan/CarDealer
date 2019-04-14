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
        private IOperationsDAO operationsDAO;
        private IBrandDAO brandDAO;
        private IModelDAO modelDAO;
        private IEngineDAO engineDAO;
        private IEmployeeDAO employeeDAO;
        private IDealDAO dealDAO;

        public MainMenu()
        {
            clientDAO = new ClientDAO();
            carInventoryDAO = new CarInventoryDAO();
            colorDAO = new ColorDAO();
            operationsDAO = new OperationsDAO();
            brandDAO = new BrandDAO();
            modelDAO = new ModelDAO();
            engineDAO = new EngineDAO();
            employeeDAO = new EmployeeDAO();
            dealDAO = new DealDAO();
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
        
        public void TestDrive(CarInventory car, int distance)
        {
            carInventoryDAO.TestDrive(car.Id, distance);
        }

        public List<CarInventory> GetCarsForRent()
        {
            return carInventoryDAO.GetCarsForRent();
        }

        public List<Operation> GetAllOperation()
        {
            return operationsDAO.GetAllOperations();
        }

        public List<Brand> GetAllBrands()
        {
            return brandDAO.GetAllBrands();
        }

        public List<Model> GetBrandModels(Brand brand)
        {
            return modelDAO.GetBrandModels(brand.Id);
        }

        public List<Engine> GetEnginesForModel(Model model)
        {
            return engineDAO.GetEnginesForModel(model.Id);
        }

        public List<Employee> GetEmployeesByPosition(string position)
        {
            return employeeDAO.GetEmployeesByPosition(position);
        }

        public List<CarInventory> GetDiscountedCars()
        {
            return carInventoryDAO.GetDiscountedCars();
        }

        public List<Deal> GetDeals()
        {
            return dealDAO.GetAllDeals();
        }

        public float GetModelBasePrice(int id)
        {
            Model model = modelDAO.GetModel(id);
            return model.BasePrice;
        }
    }
}
