using CarDealer.Interfaces;
using CarDealer.Models;
using CarDealer.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Menu
{
    class MainMenuProxy
    {
        private Client loggedClient;
        private IMainMenu mainMenu;
        private Dictionary<int, string> options;

        private static int DEFAULT_ID = 0;

        public Client LoggedClient { get => loggedClient; set => loggedClient = value; }

        public MainMenuProxy(IMainMenu menu)
        {
            mainMenu = menu;
            options = new Dictionary<int, string>();
        }

        private void addOptions(string[] optionsList)
        {
            options.Clear();
            int optionsCounter = 1;
            foreach (var option in optionsList)
            {
                options.Add(optionsCounter, option);
                optionsCounter++;
            }
        }

        public void initiate()
        {
            string[] options = new string[] { "Sign in", "Register", "Exit" };
            addOptions(options);

            while (true)
            {
                MessageHelper.PrintOptions(this.options);
                string selectedOption = MessageHelper.Read();

                bool success = int.TryParse(selectedOption, out int optionIndex);
                if (success)
                {
                    switch (optionIndex)
                    {
                        case 1:
                            Authenticate();
                            return;
                        case 2:
                            Register();
                            return;
                        case 3:
                            MessageHelper.Print(MessageHelper.MSG_BYE);
                            Environment.Exit(0);
                            break;
                    }
                }
            }
        }

        public void Authenticate()
        {
            while (true)
            {
                MessageHelper.Print("Auth Username:");
                string username = MessageHelper.Read();
                string password = "pass";

                bool success = mainMenu.authenticate(username, password, out loggedClient);

                if(success)
                {
                    MessageHelper.Print(MessageHelper.MSG_HELLO_NAME, loggedClient.FirstName);
                    return;
                }
                else
                {
                    MessageHelper.Print("Wrong cred, try again!");
                }
            }
        }

        public void Register()
        {
            Console.WriteLine("register");
            Client client = new Client(DEFAULT_ID, "testzz", "pass", "first", "last", "12345678", 1000000);
            bool success = mainMenu.register(client);
            if(success)
            {
                Console.WriteLine("registered " + client.Username);
                loggedClient = client;
                Console.WriteLine("new id: " + loggedClient.Id);
            }
            else
            {
                Console.WriteLine("fail register");
            }
        }
    }
}
