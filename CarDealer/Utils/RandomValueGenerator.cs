using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Utils
{
    class RandomValueGenerator
    {
        private static readonly int LIMIT = 100;
        private static Random random = new Random();

        public static bool GetRandomBool(int probability)
        {
            return random.Next(LIMIT) < probability;
        }

        public static void Shuffle<T>(IList<T> list)
        {
            int n = list.Count;
            while (n > 1)
            {
                n--;
                int k = random.Next(n + 1);
                T value = list[k];
                list[k] = list[n];
                list[n] = value;
            }
        }
    }
}
