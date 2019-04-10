using CarDealer.DAO;
using CarDealer.Interfaces;
using CarDealer.Models;
using CarDealer.Utils;
using System.Collections.Generic;

namespace CarDealer
{
    class Program
    {
        static void Main(string[] args)
        {
            MessageHelper.Print(MessageHelper.MSG_HELLO);
            MessageHelper.Print(MessageHelper.MSG_HELLO_NAME, "World");

            IModelDAO modelDAO = new ModelDAO();
            List<Model> models = modelDAO.GetAllModels();
            MessageHelper.PrintList(models);
        }
    }
}
