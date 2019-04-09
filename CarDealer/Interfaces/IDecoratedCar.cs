using CarDealer.Enums;
using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IDecoratedCar
    {
        int Id { get; set; }
        Model Model { get; set; }
        Color Color { get; set; }
        Engine Engine { get; set; }
        DateTime BuildDate { get; set; }
        int Mileage { get; set; }
        float InitialPrice { get; set; }
        float FinalPrice { get; set; }

        void SetOptionsLevel();
    }
}
