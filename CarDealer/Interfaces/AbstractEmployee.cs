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
        private static double probability = 60;

        protected AbstractEmployee nextEmployee { get; set; }

        protected bool isAvailable;

        public AbstractEmployee()
        {
            isAvailable = RandomValueGenerator.GetRandomBool(probability);
        }

        public void SetNextEmployee(AbstractEmployee aEmployee)
        {

        }

        protected abstract void GreetClient();
    }
}
