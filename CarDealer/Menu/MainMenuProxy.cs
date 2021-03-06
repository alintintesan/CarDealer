﻿using CarDealer.CarManufacturing;
using CarDealer.DAO;
using CarDealer.Enums;
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
        private static int TEST_DRIVE_DISTANCE = 1;
        private static int MILEAGE_LIMIT = 25000;

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
            MessageHelper.Print(MessageHelper.MSG_WELCOME);

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
            List<Deal> deals = mainMenu.GetDeals();
            foreach (Deal deal in deals)
            {
                deal.Attach(loggedClient);
                deal.Notify();
            }

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
                optionsList.Add("Back");

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
                else if (optionIndex == optionsList.Count)
                {
                    return;
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

            List<string> optionsList = new List<string>() { "Buy this car", "Negociate price", "Change color and buy", "Test drive", "Back" };
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
                        float balance = mainMenu.CheckClientBalance(loggedClient);
                        if (balance >= car.FinalPrice && balance != 0)
                        {
                            bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, balance - car.FinalPrice);
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

                        if (success && optionIndex >= 0 && optionIndex <= colors.Count)
                        {
                            CarInventory clone = car.Clone();
                            clone.Color = colors[optionIndex - 1];

                            balance = mainMenu.CheckClientBalance(loggedClient);
                            if (balance >= clone.FinalPrice)
                            {
                                bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, balance - clone.FinalPrice);
                                if (transactionSucces)
                                {
                                    // TODO: delete car from inventory
                                    MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_SUCCESS_CLONE, clone.ToString(), clone.Color.ColorName);
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
                        }
                        else
                        {
                            MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                        }
                        break;

                    case 4:
                        MessageHelper.Print(MessageHelper.MSG_TEST_DRIVING, TEST_DRIVE_DISTANCE);
                        mainMenu.TestDrive(car, TEST_DRIVE_DISTANCE);
                        MessageHelper.Print(MessageHelper.MSG_TEST_DRIVE_CONCLUSION, car.Model.CarBrand.CarBrand);
                        break;

                    case 5:
                        OptionsMenu();
                        break;
                }
            }
        }

        private void RentCar()
        {
            List<Employee> salesAgents = mainMenu.GetEmployeesByPosition(EmployeeDAO.RENTAL_AGENT);
            List<AbstractEmployee> employees = new List<AbstractEmployee>();
            RandomValueGenerator.Shuffle(employees);
            foreach (var e in salesAgents)
            {
                AbstractEmployee abstractEmployee = e;
                employees.Add(e);
            }
            for (int i = 0; i < employees.Count - 1; i++)
            {
                employees[i].SetNextEmployee(employees[i + 1]);
            }

            for (int i = 0; i < employees.Count; i++)
            {
                if (employees[i].isAvailable)
                {
                    employees[i].GreetClient();
                    break;
                }
            }

            while (true)
            {
                MessageHelper.Print(MessageHelper.MSG_CAR_LIST_RENTALS);
                List<CarInventory> cars = mainMenu.GetCarsForRent();

                List<string> optionsList = cars.Select(car => car.ToString()).ToList();
                optionsList.Add("Back");

                var options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                string selectedOption = MessageHelper.Read();
                bool success = int.TryParse(selectedOption, out int optionIndex);
                if (success && optionIndex >= 1 && optionIndex <= cars.Count)
                {
                    CarInventory selectedCar = cars[optionIndex - 1];
                    ShowCarRentalDetails(selectedCar);
                }
                else if (optionIndex == optionsList.Count)
                {
                    return;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                }
            }
        }

        private void ShowCarRentalDetails(CarInventory car)
        {
            MessageHelper.Print(MessageHelper.MSG_CAR_DETAILS);
            MessageHelper.Print(car.GetAllDetails());

            List<string> optionsList = new List<string>() { "Rent this car", "Back" };
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
                        string noOfDaysAsText = MessageHelper.GetUserInput(MessageHelper.MSG_RENTAL_NO_OF_DAYS);
                        bool isUserInputCorrect = int.TryParse(noOfDaysAsText, out int noOfDays);

                        if (isUserInputCorrect)
                        {
                            float balance = mainMenu.CheckClientBalance(loggedClient);
                            float costPerDay = car.RentCostPerDay();
                            float totalCost = costPerDay * noOfDays;

                            if (balance >= totalCost && balance != 0)
                            {
                                bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, totalCost);
                                if (transactionSucces)
                                {
                                    MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_SUCCESS_RENT, totalCost, noOfDays, car.ToString());
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
                        }
                        else
                        {
                            MessageHelper.Print(MessageHelper.MSG_INVALID_DAYS);
                        }
                        break;

                    case 5:
                        OptionsMenu();
                        break;
                }
            }
        }

        private void CarService()
        {
            List<Employee> salesAgents = mainMenu.GetEmployeesByPosition(EmployeeDAO.MECHANIC);
            List<AbstractEmployee> employees = new List<AbstractEmployee>();
            RandomValueGenerator.Shuffle(employees);
            foreach (var e in salesAgents)
            {
                AbstractEmployee abstractEmployee = e;
                employees.Add(e);
            }
            for (int i = 0; i < employees.Count - 1; i++)
            {
                employees[i].SetNextEmployee(employees[i + 1]);
            }

            for (int i = 0; i < employees.Count; i++)
            {
                if (employees[i].isAvailable)
                {
                    employees[i].GreetClient();
                    break;
                }
            }

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
                if (loggedClient.Balance >= operation.Cost)
                {
                    MessageHelper.Print(MessageHelper.MSG_SERVICE_SUCCESS);
                    loggedClient.Balance -= operation.Cost;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_NOT_ENOUGH_MONEY);
                }
            }
            else
            {
                MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
            }
        }

        private void BuildCustomCar()
        {
            List<Employee> salesAgents = mainMenu.GetEmployeesByPosition(EmployeeDAO.SALES_REPRESENTATIVE);
            List<AbstractEmployee> employees = new List<AbstractEmployee>();
            RandomValueGenerator.Shuffle(employees);
            foreach (var e in salesAgents)
            {
                AbstractEmployee abstractEmployee = e;
                employees.Add(e);
            }
            for (int i = 0; i < employees.Count - 1; i++)
            {
                employees[i].SetNextEmployee(employees[i + 1]);
            }

            for (int i = 0; i < employees.Count; i++)
            {
                if (employees[i].isAvailable)
                {
                    employees[i].GreetClient();
                    break;
                }
            }

            MessageHelper.Print(MessageHelper.MSG_BUILD_CUSTOM);
            List<Brand> brands = mainMenu.GetAllBrands();
            List<string> optionsList = brands.Select(b => b.CarBrand).ToList();
            var options = AddOptions(optionsList);
            MessageHelper.PrintOptions(options);
            MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

            Brand brand;
            Model model;
            Color color;
            Engine engine;
            EOptionsLevel optionsLevel;

            // Brand selection
            while (true)
            {
                string selectedOptionAsText = MessageHelper.Read();
                bool isInputValid = int.TryParse(selectedOptionAsText, out int optionsIndex);
                if (isInputValid && optionsIndex >= 0 && optionsIndex <= options.Count)
                {
                    brand = brands[optionsIndex - 1];
                    break;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                    return;
                }
            }

            // Model selection
            while (true)
            {
                List<Model> models = mainMenu.GetBrandModels(brand);
                optionsList = models.Select(m => m.CarModel).ToList();
                options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                string selectedOptionAsText = MessageHelper.Read();
                bool isInputValid = int.TryParse(selectedOptionAsText, out int optionsIndex);
                if (isInputValid)
                {
                    model = models[optionsIndex - 1];
                    break;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                    return;
                }
            }

            // Engine selection
            while (true)
            {
                List<Engine> engines = mainMenu.GetEnginesForModel(model);
                optionsList = engines.Select(e => e.ToString()).ToList();
                options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                string selectedOptionAsText = MessageHelper.Read();
                bool isInputValid = int.TryParse(selectedOptionAsText, out int optionsIndex);
                if (isInputValid && optionsIndex >= 0 && optionsIndex <= options.Count)
                {
                    engine = engines[optionsIndex - 1];
                    break;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                    return;
                }
            }

            // Color selection
            while (true)
            {
                List<Color> colors = mainMenu.GetAllColors();
                optionsList = colors.Select(c => c.ColorName).ToList();
                options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                string selectedOptionAsText = MessageHelper.Read();
                bool isInputValid = int.TryParse(selectedOptionAsText, out int optionsIndex);
                if (isInputValid && optionsIndex >= 0 && optionsIndex <= options.Count)
                {
                    color = colors[optionsIndex - 1];
                    break;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                    return;
                }
            }

            // Options selection
            while (true)
            {
                List<EOptionsLevel> levels = Enum.GetValues(typeof(EOptionsLevel)).Cast<EOptionsLevel>().ToList();
                optionsList = levels.Select(l => l.ToString()).ToList();
                options = AddOptions(optionsList);
                MessageHelper.PrintOptions(options);
                MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);

                string selectedOptionAsText = MessageHelper.Read();
                bool isInputValid = int.TryParse(selectedOptionAsText, out int optionsIndex);
                if (isInputValid && optionsIndex >= 0 && optionsIndex <= options.Count)
                {
                    optionsLevel = levels[optionsIndex - 1];
                    break;
                }
                else
                {
                    MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
                    return;
                }
            }

            CarBuilderDirector director = new CarBuilderDirector(new CarBuilder());
            director.Construct(model, color, engine);

            IDecoratedCar car = director.GetBuiltCar();
            car.InitialPrice = model.BasePrice;
            car.Mileage = 0;
            car.BuildDate = DateTime.Now;

            CarDecorator decorator;
            switch (optionsLevel)
            {
                case EOptionsLevel.Basic:
                    car.SetOptionsLevel();
                    break;
                case EOptionsLevel.Entry:
                    decorator = new EntryDecorator(car);
                    break;
                case EOptionsLevel.Premium:
                    decorator = new PremiumDecorator(car);
                    break;
                case EOptionsLevel.Luxury:
                    decorator = new PremiumDecorator(car);
                    break;
            }

            MessageHelper.Print(MessageHelper.MSG_BUILD_CUSTOM_FINAL_CAR, ((CarInventory)car).GetAllDetails());
            MessageHelper.Print(MessageHelper.MSG_BUILD_CUSTOM_PAYMENT, car.FinalPrice);
            string choice = MessageHelper.GetUserInput(MessageHelper.MSG_YES_NO_CHOICE);

            switch (choice)
            {
                case "Y":
                    float balance = mainMenu.CheckClientBalance(loggedClient);
                    if (balance >= car.FinalPrice)
                    {
                        bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, car.FinalPrice);
                        if (transactionSucces)
                        {
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
                    MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                    return;
            }
        }

        private void SellOwnCar()
        {
            List<Employee> salesAgents = mainMenu.GetEmployeesByPosition(EmployeeDAO.SALES_REPRESENTATIVE);
            List<AbstractEmployee> employees = new List<AbstractEmployee>();
            RandomValueGenerator.Shuffle(employees);
            foreach (var e in salesAgents)
            {
                AbstractEmployee abstractEmployee = e;
                employees.Add(e);
            }
            for (int i = 0; i < employees.Count - 1; i++)
            {
                employees[i].SetNextEmployee(employees[i + 1]);
            }

            for (int i = 0; i < employees.Count; i++)
            {
                if (employees[i].isAvailable)
                {
                    employees[i].GreetClient();
                    break;
                }
            }

            List<Brand> availableBrands = new List<Brand>();
            List<Model> availableModels = new List<Model>();

            MessageHelper.Print(MessageHelper.MSG_CAR_BRAND);
            availableBrands = mainMenu.GetAllBrands();
            var brandList = availableBrands.Select(b => b.CarBrand).ToList();
            MessageHelper.PrintOptions(AddOptions(brandList));

            MessageHelper.Print(MessageHelper.MSG_INSERT_OPTION);
            string selectedOption = MessageHelper.Read();
            bool success = int.TryParse(selectedOption, out int optionIndex1);
            if (success && optionIndex1 >= 1 && optionIndex1 <= availableBrands.Count)
            {
                Brand selectedBrand = availableBrands[optionIndex1 - 1];
                availableModels = mainMenu.GetBrandModels(selectedBrand);
                var modelsList = availableModels.Select(m => m.CarModel).ToList();
                MessageHelper.Print(MessageHelper.MSG_CAR_MODEL, selectedBrand);
                MessageHelper.PrintOptions(AddOptions(modelsList));
            }
            else
            {
                MessageHelper.Print(MessageHelper.MSG_INVALID_OPTION);
            }

            selectedOption = MessageHelper.Read();
            success = int.TryParse(selectedOption, out int optionIndex2);
            if (success && optionIndex2 >= 1 && optionIndex2 <= availableModels.Count)
            {
                Model selectedModel = availableModels[optionIndex2 - 1];
                MessageHelper.Print(MessageHelper.MSG_CAR_SELL_DETAILS);
                MessageHelper.Print(MessageHelper.MSG_CAR_MILEAGE);
                int.TryParse(MessageHelper.Read(), out int insertedMileage);
                MessageHelper.Print(MessageHelper.MSG_CAR_YEAR);
                int.TryParse(MessageHelper.Read(), out int insertedFabricationYear);
                float basePrice = mainMenu.GetModelBasePrice(selectedModel.Id);
                int currentYear = DateTime.Today.Year;
                int yearDiff = currentYear - insertedFabricationYear;

                // se scade procentajul dat de anii masinii * 2
                double priceByYears = basePrice - (((yearDiff * 2.0) / 100.0) * basePrice);

                // se scade procentajul dat de kilometrajul actual al masinii raportat la 25000 km
                double priceByMileage = basePrice - ((((double)insertedMileage / MILEAGE_LIMIT) / 100.0) * basePrice);

                double finalPrice = basePrice - (basePrice - priceByYears) - (basePrice - priceByMileage);

                MessageHelper.Print(MessageHelper.MSG_CAR_EVALUATION, finalPrice);
                string choice = MessageHelper.GetUserInput(MessageHelper.MSG_YES_NO_CHOICE);

                switch (choice)
                {
                    case "Y":
                        bool transactionSucces = mainMenu.UpdateClientBalance(loggedClient, float.Parse(finalPrice.ToString()));
                        if (transactionSucces)
                        {
                            MessageHelper.Print(MessageHelper.MSG_CAR_BUYING_SUCCESS);
                        }
                        else
                        {
                            MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                        }
                        return;

                    case "N":
                        MessageHelper.Print(MessageHelper.MSG_CAR_TRANSACTION_FAIL);
                        return;
                }
            }
        }
    }
}
