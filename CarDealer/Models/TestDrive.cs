using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class TestDrive
    {
        private int id;
        private CarInventory car;
        private Client client;
        private Employee employee;
        private int daysRented;
        private float totalCost;

        public int Id { get => id; set => id = value; }
        public CarInventory Car { get => car; set => car = value; }
        public Client Client { get => client; set => client = value; }
        public Employee Employee { get => employee; set => employee = value; }
        public int DaysRented { get => daysRented; set => daysRented = value; }
        public float TotalCost { get => totalCost; set => totalCost = value; }

        public TestDrive(
            int id,
            CarInventory car,
            Client client,
            Employee employee,
            int daysRented,
            float totalCost
            )
        {
            this.id = id;
            this.car = car;
            this.client = client;
            this.employee = employee;
            this.daysRented = daysRented;
            this.totalCost = totalCost;
        }

        public override string ToString()
        {
            return $"TBD";
        }
    }
}
