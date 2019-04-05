﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Employee
    {
        private int id;
        private string firstName;
        private string lastName;
        private string position;

        public int Id { get => id; set => id = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string LastName { get => lastName; set => lastName = value; }
        public string Position { get => position; set => position = value; }

        public Employee(int id, string firstName, string lastName, string position)
        {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.position = position;
        }

        public override string ToString()
        {
            return $"{firstName} {lastName}";
        }
    }
}
