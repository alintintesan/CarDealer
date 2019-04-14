using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Utils
{
    class RandomValueGenerator
    {
        static readonly int LIMIT = 100;
        public static bool GetRandomBool(int probability)
        {
            Random random = new Random();
            return random.Next(LIMIT) < probability;
        }
    }
}
