using CarDealer.Enums;
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
        List<Option> GetLevelOptions(EOptionsLevel level);
        float GetLevelCost(EOptionsLevel level);
        float GetEntryCost();
        float GetPremiumCost();
        float GetLuxuryCost();
    }
}
