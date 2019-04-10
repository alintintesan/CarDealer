using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IEmployeeDAO
    {
        List<Employee> getEmployeesByPosition(string position);
    }
}
