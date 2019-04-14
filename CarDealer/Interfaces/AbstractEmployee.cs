using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CarDealer.Utils;

namespace CarDealer.Interfaces
{
    abstract class AbstractEmployee
    {
        private static int probability = 75;

        protected AbstractEmployee NextEmployee { get; set; }

        public bool isAvailable { get; set; }

        public AbstractEmployee()
        {
            isAvailable = RandomValueGenerator.GetRandomBool(probability);
        }

        public void SetNextEmployee(AbstractEmployee employee)
        {
            NextEmployee = employee;
        }

        public abstract void GreetClient();
    }
}
