using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Model
    {
        private int id;
        private Brand carBrand;
        private string carModel;
        private float basePrice;

        public int Id { get => id; set => id = value; }
        public Brand CarBrand { get => carBrand; set => carBrand = value; }
        public string CarModel { get => carModel; set => carModel = value; }
        public float BasePrice { get => basePrice; set => basePrice = value; }

        public Model(int id, Brand brand, string model, float basePrice)
        {
            this.id = id;
            this.carBrand = brand;
            this.carModel = model;
            this.basePrice = basePrice;
        }

        public override string ToString()
        {
            return $"{carBrand} Model: {carModel} Base Price: {basePrice}";
        }
    }
}
