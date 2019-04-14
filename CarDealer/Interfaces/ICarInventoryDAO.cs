using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface ICarInventoryDAO
    {
        List<CarInventory> GetAllCars();
        void TestDrive(int id, int distance);
        List<CarInventory> GetCarsForRent();
        List<CarInventory> GetDiscountedCars();
    }
}
