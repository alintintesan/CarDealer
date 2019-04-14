using CarDealer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Interfaces
{
    interface IModelDAO
    {
        List<Model> GetAllModels();
        List<Model> GetBrandModels(int brandId);
        Model GetModel(int id);
    }
}
