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
        public static readonly string MSG_HELLO = "Hello!";
        public static readonly string MSG_HELLO_NAME = Environment.NewLine + "Hello {0}! What would you like to do?";
        public static readonly string MSG_HELLO_NEW_USER = "Welcome {0}! What would you like to do?";
        public static readonly string MSG_BYE = "Have a nice day!";

        public static readonly string MSG_YES_NO_CHOICE = "Y/N";

        public static readonly string MSG_INSERT_OPTION = "Please insert your option:";
        public static readonly string MSG_OPTION = "{0}) {1}{2}";
        public static readonly string MSG_AUTH = "{0}) {1}{2}";
        public static readonly string MSG_EMPLOYEE_GREETING = "Hi, my name is {0} {1} and I'm your {2} today! How can I help you?";

        public static readonly string MSG_USERNAME = "Please enter your username:";
        public static readonly string MSG_PASSWORD = "Please enter your password:";
        public static readonly string MSG_AUTH_FAILED = "Wrong credentials. Please try again!";
        public static readonly string MSG_FIRST_NAME = "Please enter your first name:";
        public static readonly string MSG_LAST_NAME = "Please enter your last name:";
        public static readonly string MSG_REGISTRATION_FAILED = "This username already exists! Please pick another.";
        public static readonly string MSG_INVALID_OPTION = "Invalid option! Please try again!";

        public static readonly string MSG_CAR_LIST = $"{Environment.NewLine}Here are all the cars listed for selling, choose one for more details!";
        public static readonly string MSG_COLOR_LIST = $"{Environment.NewLine}Here are all the available colors, choose the one you like the best!";
        public static readonly string MSG_CAR_DETAILS = "Here are more details about this car:";
        public static readonly string MSG_CAR_TRANSACTION_SUCCESS = "Purchase and payment of your {0} completed successfully! Enjoy your new car!";
        public static readonly string MSG_CAR_TRANSACTION_FAIL = "Transaction failed, please try again later.";
        public static readonly string MSG_NOT_ENOUGH_MONEY = "You don't have enough money on your credit card!";
        public static readonly string MSG_NEGOCIATE = "The best I can do is {0} for this car. Do we have a deal?";
        public static readonly string MSG_REFUSE_DISCOUNT = "All right, maybe you can find another car that suits your needs better!";

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

        /// <summary>
        /// Prints a list of options where the user can choose from
        /// </summary>
        public static void PrintOptions(Dictionary<int, string> options)
        {
            foreach (var option in options)
            {
                Print(MSG_OPTION, option.Key, option.Value, Environment.NewLine);
            }
            Print(Environment.NewLine);
        }

        /// <summary>
        /// Displays a message and reads user's input from console
        /// </summary>
        public static string GetUserInput(string text)
        {
            Print(text);
            return Console.ReadLine();
        }

        /// <summary>
        /// Reads user's input from console
        /// </summary>
        public static string Read()
        {
            return Console.ReadLine();
        }
    }
}
