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
    abstract class CarDecorator : IDecoratedCar
    {
        protected IDecoratedCar decoratedCar;

        public double FinalPrice { get => decoratedCar.FinalPrice; set => decoratedCar.FinalPrice = value; }
        public List<Option> Options { get => decoratedCar.Options; set => decoratedCar.Options = value; }
        public EOptionsLevel OptionsLevel { get => decoratedCar.OptionsLevel; set => decoratedCar.OptionsLevel = value; }

        public CarDecorator(IDecoratedCar decoCar)
        {
            this.decoratedCar = decoCar;
        }

        public abstract void SetOptionsLevel();
    }
}
