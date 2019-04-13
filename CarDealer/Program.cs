using CarDealer.DAO;
using CarDealer.Interfaces;
using CarDealer.Menu;
using CarDealer.Models;
using CarDealer.Utils;
using System.Collections.Generic;

namespace CarDealer
{
    class Program
    {
        static void Main(string[] args)
        {
            //test();
            MainMenuProxy menu = new MainMenuProxy(new MainMenu());
            menu.initiate();

            //Chain of Responsibility Pattern
            /*AbstractLogger loggerChain = getChainOfLoggers();

            loggerChain.logMessage(AbstractLogger.info,"This is an information.");

            loggerChain.logMessage(AbstractLogger.debug,"This is an debug level information.");

            loggerChain.logMessage(AbstractLogger.error,"This is an error information.");*/
        }

        static void test()
        {
            IModelDAO modelDAO = new ModelDAO();
            List<Model> models = modelDAO.GetAllModels();
            MessageHelper.PrintList(models);

            IEmployeeDAO employeeDAO = new EmployeeDAO();
            List<Employee> employees = employeeDAO.getEmployeesByPosition(EmployeeDAO.SALES_REPREZENTATIVE);
            MessageHelper.PrintList(employees);

            string username = "test", password = "pass";
            Client client;
            IClientDAO clientDAO = new ClientDAO();
            bool isAuth = clientDAO.Authenticate(username, password, out client);
            if (isAuth)
            {
                MessageHelper.Print(MessageHelper.MSG_HELLO_NAME, client.FirstName + client.LastName);
            }
            else
            {
                MessageHelper.Print("Auth failed");
            }
        }

        private static AbstractLogger getChainOfLoggers()
        {

            AbstractLogger errorLogger = new ErrorLogger(AbstractLogger.error);
            AbstractLogger fileLogger = new FileLogger(AbstractLogger.debug);
            AbstractLogger consoleLogger = new ConsoleLogger(AbstractLogger.info);

            errorLogger.setNextLogger(fileLogger);
            fileLogger.setNextLogger(consoleLogger);

            return errorLogger;
        }
    }
}
