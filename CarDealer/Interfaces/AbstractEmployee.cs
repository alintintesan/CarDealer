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
        private static int probability = 60;

        protected AbstractEmployee NextEmployee { get; set; }

        protected bool isAvailable;

        public AbstractEmployee()
        {
            isAvailable = RandomValueGenerator.GetRandomBool(probability);
        }

        public void SetNextEmployee(AbstractEmployee employee)
        {
            NextEmployee = employee;
        }

        protected abstract void GreetClient();
    }
}
