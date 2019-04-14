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
            float cost = dao.GetLuxuryCost();
            List<Option> options = dao.GetLuxuryOptions();
            decoratedCar.FinalPrice = decoratedCar.InitialPrice;
            decoratedCar.FinalPrice += cost;
            decoratedCar.Options = options;
        }
    }
}
