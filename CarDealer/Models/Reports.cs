using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Reports
    {
        private int id;
        private Client client;
        private Employee employee;
        private DateTime date;
        private float price;
        private string details;
        private string typeOfTransaction;

        public int Id { get => id; set => id = value; }
        public Client Client { get => client; set => client = value; }
        public Employee Employee { get => employee; set => employee = value; }
        public DateTime Date { get => date; set => date = value; }
        public float Price { get => price; set => price = value; }
        public string Details { get => details; set => details = value; }
        public string TypeOfTransaction { get => typeOfTransaction; set => typeOfTransaction = value; }

        public Reports(
            int id,
            Client client,
            Employee employee,
            DateTime date,
            float price,
            string details,
            string typeOfTransaction)
        {
            this.id = id;
            this.client = client;
            this.employee = employee;
            this.date = date;
            this.price = price;
            this.details = details;
            this.typeOfTransaction = typeOfTransaction;
        }

        public override string ToString()
        {
            return $"Client: {client}{Environment.NewLine}Employee: {employee}{Environment.NewLine}" +
                $"Date: {date}{Environment.NewLine}Price: {price} Type of transaction: {typeOfTransaction}{Environment.NewLine}" +
                $"Details: {details}";
        }
    }
}
