using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IOptionDAO
    {
        List<Option> GetAllOptions();
        List<Option> GetEntryOptions();
        List<Option> GetPremiumOptions();
        List<Option> GetLuxuryOptions();

        float GetEntryCost();
        float GetPremiumCost();
        float GetLuxuryCost();
    }
}
