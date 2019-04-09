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

        public int Id { get => decoratedCar.Id; set => decoratedCar.Id = value; }
        public Model Model { get => decoratedCar.Model; set => decoratedCar.Model = value; }
        public Color Color { get => decoratedCar.Color; set => decoratedCar.Color = value; }
        public Engine Engine { get => decoratedCar.Engine; set => decoratedCar.Engine = value; }
        public DateTime BuildDate { get => decoratedCar.BuildDate; set => decoratedCar.BuildDate = value; }
        public int Mileage { get => decoratedCar.Mileage; set => decoratedCar.Mileage = value; }
        public float InitialPrice { get => decoratedCar.InitialPrice; set => decoratedCar.InitialPrice = value; }
        public float FinalPrice { get => decoratedCar.FinalPrice; set => decoratedCar.FinalPrice = value; }

        public CarDecorator(IDecoratedCar decoCar)
        {
            this.decoratedCar = decoCar;
        }

        public abstract void SetOptionsLevel();
    }
}
