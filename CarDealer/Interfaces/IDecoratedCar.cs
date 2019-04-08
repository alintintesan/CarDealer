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
        double FinalPrice { get; set; }
        List<Option> Options { get; set; }
        EOptionsLevel OptionsLevel { get; set; }

        void SetOptionsLevel();
    }
}
