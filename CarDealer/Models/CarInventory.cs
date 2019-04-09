using CarDealer.Enums;
using CarDealer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class CarInventory : IDecoratedCar
    {
        public int Id { get; set; }
        public Model Model { get; set; }
        public Color Color { get; set; }
        public Engine Engine { get; set; }
        public DateTime BuildDate { get; set; }
        public int Mileage { get; set; }
        public float InitialPrice { get; set; }
        public float FinalPrice { get; set; }
        private List<Option> Options { get; set; }
        private EOptionsLevel OptionsLevel { get; set; }

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

        public override string ToString()
        {
            return $"{Model}{Environment.NewLine}{Color}{Environment.NewLine}{Engine}{Environment.NewLine}" +
                $"Build date: {BuildDate} Mileage: {Mileage}{Environment.NewLine}Initial price: {InitialPrice} Final Price: {FinalPrice}" +
                $"{Environment.NewLine}Options level: {OptionsLevel}{Environment.NewLine}Options: {Environment.NewLine}{GetOptionsAsString()}";
        }

        private string GetOptionsAsString()
        {
            StringBuilder builder = new StringBuilder();
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
    } 
}
