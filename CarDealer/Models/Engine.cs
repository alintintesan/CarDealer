using CarDealer.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    [Serializable] class Engine
    {
        private int id;
        private string fuelType;
        private int power;
        private string capacity;

        public int Id { get => id; set => id = value; }
        public string FuelType { get => fuelType; set => fuelType = value; }
        public int Power { get => power; set => power = value; }
        public string Capacity { get => capacity; set => capacity = value; }

        public Engine(int id, string type, int power, string capacity)
        {
            this.id = id;
            this.fuelType = type;
            this.power = power;
            this.capacity = capacity;
        }

        public override string ToString()
        {
            return $"Engine type: {fuelType} Power (hp): {power} Capacity (cc): {capacity}";
        }
    }
}
