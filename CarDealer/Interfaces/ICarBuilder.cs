using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    public interface ICarBuilder
    {
        void SetModel(string Model);
        void SetColor(string Color);
        void SetEngine(string Engine); // asta cred ca trebuie EFuelType, nu string
        CarInventory GetCar();
    }
}
