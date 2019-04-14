using CarDealer.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    [Serializable]
    class Option
    {
        private int id;
        private string carOption;
        private float price;
        private EOptionsLevel level;

        public int Id { get => id; set => id = value; }
        public string CarOption { get => carOption; set => carOption = value; }
        public float Price { get => price; set => price = value; }
        public EOptionsLevel Level { get => level; set => level = value; }

        public Option(int id, string option, float price, EOptionsLevel level)
        {
            this.id = id;
            this.carOption = option;
            this.price = price;
            this.level = level;
        }

        public override string ToString()
        {
            return $"Option: {carOption} | Price: {price} | Level: {level}";
        }
    }
}
