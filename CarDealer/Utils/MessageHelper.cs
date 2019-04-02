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

        public static void Print(string text)
        {
            Console.WriteLine(text);
        }

        public static void Print(string text, params object[] args)
        {
            string message = String.Format(text, args);
            Print(message);
        }
    }
}
