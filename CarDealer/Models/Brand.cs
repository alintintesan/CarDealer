using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Brand
    {
        private int id;
        private string carBrand;

        public int Id { get => id; set => id = value; }
        public string CarBrand { get => carBrand; set => carBrand = value; }

        public Brand(int id, string brand)
        {
            this.id = id;
            this.carBrand = brand;
        }

        public override string ToString()
        {
            return $"{carBrand}";
        }
    }
}
