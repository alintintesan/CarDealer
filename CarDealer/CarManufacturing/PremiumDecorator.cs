using System.Collections.Generic;

using CarDealer.DAO;
using CarDealer.Enums;
using CarDealer.Interfaces;
using CarDealer.Models;

namespace CarDealer.CarManufacturing
{
    class PremiumDecorator : CarDecorator
    {
        public PremiumDecorator(IDecoratedCar decoCar) : base(decoCar)
        {
            decoratedCar.OptionsLevel = EOptionsLevel.Premium;
            SetOptionsLevel();
        }

        public override void SetOptionsLevel()
        {
            IOptionDAO dao = new OptionDAO();
            float entryCost = dao.GetPremiumCost();
            List<Option> entryOptions = dao.GetLuxuryOptions();
            decoratedCar.FinalPrice += entryCost;
            decoratedCar.Options = entryOptions;
        }
    }
}
