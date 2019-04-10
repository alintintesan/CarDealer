using CarDealer.Interfaces;
using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.CarManufacturing
{ 
    class CarBuilder : ICarBuilder
    {
        private CarInventory car;

        public CarBuilder()
        {
            car = new CarInventory();
        }

        public CarInventory GetCar()
        {
            return car;
        }

        public void SetColor(Color color)
        {
            car.Color = color;
        }

        public void SetEngine(Engine engine)
        {
            car.Engine = engine;
        }

        public void SetModel(Model model)
        {
            car.Model = model;
        }
    }
}
