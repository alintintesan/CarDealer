using CarDealer.DAO;
using CarDealer.Interfaces;
using CarDealer.Menu;
using CarDealer.Models;
using CarDealer.Utils;
using System;
using System.Collections.Generic;

namespace CarDealer
{
    class Program
    {
        static void Main(string[] args)
        {
            MainMenuProxy menu = new MainMenuProxy(new MainMenu());
            menu.Initialize();
        }
    }
}
