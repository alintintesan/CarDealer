﻿using CarDealer.Interfaces;
using CarDealer.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Client : IClient
    {
        public int Id { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CreditCardNo { get; set; }
        public float Balance { get; set; }

        public Client(
            int id, 
            string username,
            string password,
            string firstName,
            string lastName,
            string creditCardNo,
            float balance)
        {
            Id = id;
            Username = username;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            CreditCardNo = creditCardNo;
            Balance = balance;
        }

        public void Update(Deal deal)
        {
            MessageHelper.Print(MessageHelper.MSG_DEAL, $"{deal.CarBrand} {deal.CarModel.Trim()}", deal.DiscountedPrice);
        }

        public override string ToString()
        {
            return $"{FirstName} {LastName}";
        }
    }
}
