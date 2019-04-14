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

        private static int DEFAULT_ID = 0;
        private static string DEFAULT_CREDIT_CARD_NO = "12345678";
        private static float DEFAULT_BALANCE = 500000;
        private static float DISCOUNT = 200;

        public Client LoggedClient { get => loggedClient; set => loggedClient = value; }

        public MainMenuProxy(IMainMenu menu)
        {
            mainMenu = menu;
        }

        private Dictionary<int, string> AddOptions(List<string> optionsList)
        {
            Dictionary<int, string> options = new Dictionary<int, string>();
            int optionsCounter = 1;
            foreach (var option in optionsList)
            {
                options.Add(optionsCounter, option);
                optionsCounter++;
            }
            return options;
        }

        public void Initialize()
        {
            List<string> optionsList = new List<string>() { "Sign in", "Register", "Exit" };
            var options = AddOptions(optionsList);

            while (true)
            {
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);
                string selectedOption = MessageHelper.Read();

                bool success = int.TryParse(selectedOption, out int optionIndex);
                if (success)
                {
                    switch (optionIndex)
                    {
                        case 1:
                            Authenticate();
                            break;
                        case 2:
                            Register();
                            break;
                        case 3:
                            MessageHelper.Print(MessageHelper.MSG_BYE);
                            Environment.Exit(0);
                            break;
                        default:
                            MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                            break;
                    }
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                }
            }
        }

        private void Authenticate()
        {
            while (true)
            {
                string username = MessageHelper.GetUserInput(MessageHelper.MSG_USERNAME);
                MessageHelper.Print(MessageHelper.MSG_PASSWORD);
                string password = AuthenticationHelper.ReadLineMasked();

                bool success = mainMenu.Authenticate(username, password, out loggedClient);

                if (success)
                {
                    MessageHelper.Print(MessageHelper.MSG_HELLO_NAME, loggedClient.FirstName);
                    OptionsMenu();
                    return;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_AUTH_FAILED);
                }
            }
        }

        private void Register()
        {
            while (true)
            {
                string username = MessageHelper.GetUserInput(MessageHelper.MSG_USERNAME);
                MessageHelper.Print(MessageHelper.MSG_PASSWORD);
                string password = AuthenticationHelper.ReadLineMasked();
                string firstName = MessageHelper.GetUserInput(MessageHelper.MSG_FIRST_NAME);
                string lastName = MessageHelper.GetUserInput(MessageHelper.MSG_LAST_NAME);

                Client client = new Client(DEFAULT_ID, username, password, firstName, lastName, DEFAULT_CREDIT_CARD_NO, DEFAULT_BALANCE);
                bool success = mainMenu.Register(client);
                if (success)
                {
                    MessageHelper.Print(MessageHelper.MSG_HELLO_NEW_USER, client.Username);
                    loggedClient = client;
                    OptionsMenu();
                    return;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_REGISTRATION_FAILED);
                }
            }
        }

        private void OptionsMenu()
        {
            // display deals

            while (true)
            {
                List<string> optionsList = new List<string>()
                { "Buy a car", "Rent a car", "Car service", "Build custom car", "Sell own car", "Log out"};

                var options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);
                string selectedOption = MessageHelper.Read();

                bool success = int.TryParse(selectedOption, out int optionIndex);
                if (success)
                {
                    switch (optionIndex)
                    {
                        case 1:
                            BuyCar();
                            break;
                        case 2:
                            RentCar();
                            break;
                        case 3:
                            CarService();
                            break;
                        case 4:
                            BuildCustomCar();
                            break;
                        case 5:
                            SellOwnCar();
                            break;
                        case 6:
                            return;
                        default:
                            MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                            break;
                    }
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                }
            }
        }

        private void BuyCar()
        {
            while (true)
            {
                MessageHelper.Print(MessageHelper.MSG_CAR_LIST);
                List<CarInventory> cars = mainMenu.GetAllCars();

                List<string> optionsList = cars.Select(car => car.ToString()).ToList();

                var options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);
                
                string selectedOption = MessageHelper.Read();
                bool success = int.TryParse(selectedOption, out int optionIndex);
                if (success && optionIndex >= 1 && optionIndex <= cars.Count)
                {
                    CarInventory selectedCar = cars[optionIndex - 1];
                    ShowCarDetails(selectedCar);
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                }
            }
        }

        private void ShowCarDetails(CarInventory car)
        {
            MessageHelper.Print(MessageHelper.MSG_CAR_DETAILS);
            MessageHelper.Print(car.GetAllDetails());

            List<string> optionsList = new List<string>() { "Buy this car", "Negociate price", "Change color and buy", "Back to main menu"};
            var options = AddOptions(optionsList);
            MessageHelper.PrintOptions(options);
            MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

            string selectedOption = MessageHelper.Read();
            bool success = int.TryParse(selectedOption, out int optionIndex);
            if(success)
            {
                switch (optionIndex)
                {
                    case 1:
                        float balance = mainMenu.CheckClientBalance(loggedClient);
                        if(balance >= car.FinalPrice)
                        {
                            bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, balance - car.FinalPrice);
                            if(transactionSucces)
                            {
                                // delete car from inventory
                                // write to reports
                                MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_SUCCESS, car.ToString());
                            }
                            else
                            {
                                MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                            }
                        }
                        else
                        {
                            MessageHelper.Print(MessageHelper.MSG_NOT_ENOUGH_MONEY);
                        }
                        return;

                    case 2:
                        float discountedPrice = car.FinalPrice - DISCOUNT;
                        MessageHelper.Print(MessageHelper.MSG_NEGOCIATE, discountedPrice);
                        string choice = MessageHelper.GetUserInput(MessageHelper.MSG_YES_NO_CHOICE);

                        switch (choice)
                        {
                            case "Y":
                                balance = mainMenu.CheckClientBalance(loggedClient);
                                if (balance >= discountedPrice)
                                {
                                    bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, balance - discountedPrice);
                                    if (transactionSucces)
                                    {
                                        // delete car from inventory
                                        // write to reports
                                        MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_SUCCESS, car.ToString());
                                    }
                                    else
                                    {
                                        MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                                    }
                                }
                                else
                                {
                                    MessageHelper.Print(MessageHelper.MSG_NOT_ENOUGH_MONEY);
                                }
                                return;

                            case "N":
                                MessageHelper.Print(MessageHelper.MSG_REFUSE_DISCOUNT);
                                return;
                        }
                        break;

                    case 3:
                        MessageHelper.Print(MessageHelper.MSG_COLOR_LIST);
                        List<Color> colors = mainMenu.GetAllColors();
                        optionsList = colors.Select(color => color.ColorName).ToList();
                        options = AddOptions(optionsList);

                        MessageHelper.PrintOptions(options);
                        MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                        selectedOption = MessageHelper.Read();
                        success = int.TryParse(selectedOption, out optionIndex);

                        if(success && optionIndex >= 0 && optionIndex <= colors.Count)
                        {
                            // clone car
                            //float balance = mainMenu.CheckClientBalance(loggedClient);
                            //if (balance >= car.FinalPrice)
                            //{
                            //    bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, balance - car.FinalPrice);
                            //    if (transactionSucces)
                            //    {
                            //        // delete car from inventory
                            //        // write to reports
                            //        MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_SUCCESS, car.ToString());
                            //    }
                            //    else
                            //    {
                            //        MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                            //    }
                            //}
                            //else
                            //{
                            //    MessageHelper.Print(MessageHelper.MSG_NOT_ENOUGH_MONEY);
                            //}
                            return;
                        }
                        else
                        {
                            MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                        }
                        break;

                    case 4:
                        OptionsMenu();
                        break;
                }
            }
        }

        private void RentCar()
        {

        }

        private void CarService()
        {
            MessageHelper.Print(MessageHelper.MSG_SERVICE_WELCOME);
            List<Operation> operations = mainMenu.GetAllOperation();

            List<string> operationsList = operations.Select(operation => operation.ToString()).ToList();

            var options = AddOptions(operationsList);
            MessageHelper.PrintOptions(options);
            MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

            string selectedOption = MessageHelper.Read();
            bool success = int.TryParse(selectedOption, out int optionIndex);
            if (success && optionIndex >= 1 && optionIndex <= operations.Count)
            {

                Operation operation = operations[optionIndex - 1];
            }
            else
            {
                MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
            }
        }

        private void BuildCustomCar()
        {

        }

        private void SellOwnCar()
        {

        }
    }
}
