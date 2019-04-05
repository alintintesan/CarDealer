using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Utils
{
    /// <summary>
    /// Helper class that should be used
    /// for printing messages to the console
    /// instead of calling Console.WriteLine()
    /// All hardcoded strings should be added here
    /// </summary>
    class MessageHelper
    {
        #region General Messages

        public static readonly string MSG_HELLO = "Hello!";
        public static readonly string MSG_HELLO_NAME = "Hello {0}!";

        #endregion

        /// <summary>
        /// Prints a string to the console
        /// </summary>
        public static void Print(string text)
        {
            Console.WriteLine(text);
        }

        /// <summary>
        /// Prints a formatted string to the console
        /// </summary>
        public static void Print(string text, params object[] args)
        {
            string message = String.Format(text, args);
            Print(message);
        }

        /// <summary>
        /// Prints a list with items of any type to the console
        /// </summary>
        public static void PrintList<T>(List<T> itemsList)
        {
            foreach (var item in itemsList)
            {
                Console.WriteLine(item);
            }
        }
    }
}
