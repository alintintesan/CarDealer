using CarDealer.Enums;
using CarDealer.Interfaces;
using CarDealer.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    [Serializable]
    class CarInventory : IDecoratedCar, ICarPrototype
    {
        private static readonly float RENT_PER_DAY_PERCENTAGE = 1;

        public int Id { get; set; }
        public Model Model { get; set; }
        public Color Color { get; set; }
        public Engine Engine { get; set; }
        public DateTime BuildDate { get; set; }
        public int Mileage { get; set; }
        public float InitialPrice { get; set; }
        public float FinalPrice { get; set; }
        public List<Option> Options { get; set; }
        public EOptionsLevel OptionsLevel { get; set; }

        public CarInventory(
            int id,
            Model model,
            Color color,
            Engine engine,
            DateTime buildDate,
            int mileage,
            float initialPrice
            )
        {
            Id = id;
            Model = model;
            Color = color;
            Engine = engine;
            BuildDate = buildDate;
            Mileage = mileage;
            InitialPrice = initialPrice;
            OptionsLevel = EOptionsLevel.Basic;
        }

        public CarInventory()
        {
        }

        public override string ToString()
        {
            return $"{BuildDate.Year} {Model.CarBrand} {Model.CarModel}";
        }

        public string GetAllDetails()
        {
            return $"Brand: {Model.CarBrand}{Environment.NewLine}" +
                $"Model: {Model.CarModel}{Environment.NewLine}" +
                $"Color: {Color.ColorName}{Environment.NewLine}" +
                $"Engine: {Engine}{Environment.NewLine}" +
                $"Build date: {BuildDate}{Environment.NewLine}" +
                $"Mileage: {Mileage}{Environment.NewLine}" +
                $"Initial price: {InitialPrice}{Environment.NewLine}" +
                $"Final Price: {FinalPrice}{Environment.NewLine}" +
                $"Options level: {OptionsLevel.ToString()}{Environment.NewLine}" +
                $"Options: {Environment.NewLine}{GetOptionsAsString()}";
        }

        private string GetOptionsAsString()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(Environment.NewLine);
            foreach(var option in Options)
            {
                builder.Append(option.ToString()).Append(Environment.NewLine);
            }
            return builder.ToString();
        }

        public void SetOptionsLevel()
        {
            FinalPrice = InitialPrice;
        }

        public CarInventory Clone()
        {
            return (CarInventory)ObjectHelper.DeepCopy<CarInventory>(this);
        }

        public float RentCostPerDay()
        {
            return (float) InitialPrice / 100 * RENT_PER_DAY_PERCENTAGE;
        }
    } 
}
