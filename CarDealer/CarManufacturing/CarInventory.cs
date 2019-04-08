using CarDealer.Enums;
using CarDealer.Interfaces;
using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.CarManufacturing
{
    class CarInventory : IDecoratedCar
    {
        public double FinalPrice { get; set; }
        public List<Option> Options { get; set; }
        public EOptionsLevel OptionsLevel { get; set; }

        public CarInventory()
        {
            Options = new List<Option>();
            SetOptionsLevel();
            FinalPrice = 0;
        }

        public void SetOptionsLevel()
        {
            FinalPrice = 0;
        }

        public override string ToString()
        {
            return Options.ToString();
        }
    }
}
