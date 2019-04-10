using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface ICarBuilder
    {
        void SetModel(Model model);
        void SetColor(Color color);
        void SetEngine(Engine engine);
        CarInventory GetCar();
    }
}
