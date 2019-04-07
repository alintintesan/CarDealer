using CarDealer.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class CarInventory
    {
        private int id;
        private Model model;
        private Color color;
        private Engine engine;
        private DateTime buildDate;
        private int mileage;
        private float initialPrice;
        private float finalPrice;
        private List<Option> options;
        private EOptionsLevel optionsLevel;

        public int Id { get => id; set => id = value; }
        public Model Model { get => model; set => model = value; }
        public Color Color { get => color; set => color = value; }
        public Engine Engine { get => engine; set => engine = value; }
        public DateTime BuildDate { get => buildDate; set => buildDate = value; }
        public int Mileage { get => mileage; set => mileage = value; }
        public float InitialPrice { get => initialPrice; set => initialPrice = value; }
        public float FinalPrice { get => finalPrice; set => finalPrice = value; }
        private List<Option> Options { get => options; set => options = value; }
        private EOptionsLevel OptionsLevel { get => optionsLevel; set => optionsLevel = value; }

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
            this.id = id;
            this.model = model;
            this.color = color;
            this.engine = engine;
            this.buildDate = buildDate;
            this.mileage = mileage;
            this.initialPrice = initialPrice;
            this.optionsLevel = EOptionsLevel.Basic;
        }

        public override string ToString()
        {
            return $"{model}{Environment.NewLine}{color}{Environment.NewLine}{engine}{Environment.NewLine}" +
                $"Build date: {buildDate} Mileage: {mileage}{Environment.NewLine}Initial price: {initialPrice} Final Price: {finalPrice}" +
                $"{Environment.NewLine}Options level: {optionsLevel}{Environment.NewLine}Options: {Environment.NewLine}{getOptionsAsString()}";
        }

        private string getOptionsAsString()
        {
            StringBuilder builder = new StringBuilder();
            foreach(var option in options)
            {
                builder.Append(option.ToString()).Append(Environment.NewLine);
            }
            return builder.ToString();
        }
    } 
}
