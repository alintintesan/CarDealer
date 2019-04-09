using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{ 
    public class CarBuilder : ICarBuilder
    {
        private CarInventory car { get; set; } = new CarInventory();

        public CarInventory GetCar()
        {
            return car;
        }

        public void SetColor(string Color)
        {
            car.Color = Color;
        }

        public void SetEngine(string Engine)
        {
            car.Engine = Engine;
        }

        public void SetModel(string Model)
        {
            car.Model = Model;
        }
    }
}
