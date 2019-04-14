using System.Collections.Generic;

using CarDealer.DAO;
using CarDealer.Enums;
using CarDealer.Interfaces;
using CarDealer.Models;

namespace CarDealer.CarManufacturing
{
    class EntryDecorator : CarDecorator
    {
        public EntryDecorator(IDecoratedCar decoCar) : base(decoCar)
        {
            decoratedCar.OptionsLevel = EOptionsLevel.Entry;
            SetOptionsLevel();
        }

        public override void SetOptionsLevel()
        {
            IOptionDAO dao = new OptionDAO();
            float cost = dao.GetEntryCost();
            List<Option> options = dao.GetEntryOptions();
            decoratedCar.FinalPrice = decoratedCar.InitialPrice;
            decoratedCar.FinalPrice += cost;
            decoratedCar.Options = options;
        }
    }
}
