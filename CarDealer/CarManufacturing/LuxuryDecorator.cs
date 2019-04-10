using CarDealer.DAO;
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
    class LuxuryDecorator : CarDecorator
    {

        public LuxuryDecorator(IDecoratedCar decoCar) : base(decoCar)
        {
            decoratedCar.OptionsLevel = EOptionsLevel.Luxury;
            SetOptionsLevel();
        }

        public override void SetOptionsLevel()
        {
            IOptionDAO dao = new OptionDAO();
            float entryCost = dao.GetEntryCost();
            List<Option> entryOptions = dao.GetLuxuryOptions();
            decoratedCar.FinalPrice += entryCost;
            decoratedCar.Options = entryOptions;
        }
    }
}
