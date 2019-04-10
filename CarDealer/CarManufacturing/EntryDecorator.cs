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
            float entryCost = dao.GetEntryCost();
            List<Option> entryOptions = dao.GetEntryOptions();
            decoratedCar.FinalPrice += entryCost;
            decoratedCar.Options = entryOptions;
        }
    }
}
