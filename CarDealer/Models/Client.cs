using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Client
    {
        private int id;
        private string username;
        private string password;
        private string firstName;
        private string lastName;
        private string creditCardNo;
        private float balance;

        public int Id { get => id; set => id = value; }
        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string CreditCardNo { get => creditCardNo; set => creditCardNo = value; }
        public float Balance { get => balance; set => balance = value; }

        public Client(
            int id, 
            string username,
            string password,
            string firstName,
            string lastName,
            string creditCardNo,
            float balance)
        {
            this.id = id;
            this.username = username;
            this.password = password;
            this.firstName = firstName;
            this.lastName = lastName;
            this.creditCardNo = creditCardNo;
            this.balance = balance;
        }

        public override string ToString()
        {
            return $"{firstName} {lastName}";
        }
    }
}
