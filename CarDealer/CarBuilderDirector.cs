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
        public void Construct(Model model, Color color, Engine engine)
        {
            builder.SetModel(model);
            builder.SetColor(color);
            builder.SetEngine(engine);
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
