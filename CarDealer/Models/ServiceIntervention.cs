using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class ServiceIntervention
    {
        private int id;
        private Client client;
        private Employee employee;
        private Operation operation;
        private DateTime date;
        private float totalCost;

        public int Id { get => id; set => id = value; }
        public Client Client { get => client; set => client = value; }
        public Employee Employee { get => employee; set => employee = value; }
        public Operation Operation { get => operation; set => operation = value; }
        public DateTime Date { get => date; set => date = value; }
        public float TotalCost { get => totalCost; set => totalCost = value; }

        public ServiceIntervention(
            int id,
            Client client,
            Employee employee,
            Operation operation,
            DateTime date,
            float totalCost
            )
        {
            this.id = id;
            this.client = client;
            this.employee = employee;
            this.operation = operation;
            this.date = date;
            this.totalCost = totalCost;
        }

        public override string ToString()
        {
            return $"Client: {client}{Environment.NewLine}Employee: {employee}{Environment.NewLine}" +
                $"Operation: {operation} Date: {date}{Environment.NewLine}Total cost: {totalCost}";
        }
    }
}
