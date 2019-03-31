using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Utils
{
    class MessageHelper
    {
        public static readonly string MSG_HELLO = "Hello!";
        public static readonly string MSG_HELLO_NAME = "Hello {0}!";

        public static void Print(string key)
        {
            Console.WriteLine(key);
        }

        public static void Format(string key, params object[] args)
        {
            string message = String.Format(key, args);
            Print(message);
        }
    }
}
