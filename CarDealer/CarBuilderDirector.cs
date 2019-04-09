using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer
{
    class CarBuilderDirector
    {
        public ICarBuilder builder { get; set; }
        public void Construct(string Model, string Color, string Engine)
        {
            builder.SetModel("");
            builder.SetColor("");
            builder.SetEngine("");
        }
        public CarBuilderDirector()
        {
            builder = new CarBuilder();
        }
        public CarInventory GetBuiltCar()
        {
            return builder.GetCar();
        }


    }
}
