using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Deal
    {
        private int id;
        private CarInventory car;
        private float discountedPrice;

        public int Id { get => id; set => id = value; }
        public CarInventory Car { get => car; set => car = value; }
        public float DiscountedPrice { get => discountedPrice; set => discountedPrice = value; }

        public Deal(int id, CarInventory car, float discountedPrice)
        {
            this.id = id;
            this.car = car;
            this.discountedPrice = discountedPrice;
        }

        public override string ToString()
        {
            return $"Car:{Environment.NewLine}{car}{Environment.NewLine}Discounted price: {discountedPrice}";
        }
    }
}
