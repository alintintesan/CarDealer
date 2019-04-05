using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Operation
    {
        private int id;
        private string operationName;
        private float cost;

        public int Id { get => id; set => id = value; }
        public string OperationName { get => operationName; set => operationName = value; }
        public float Cost { get => cost; set => cost = value; }

        public Operation(int id, string operation, float cost)
        {
            this.id = id;
            this.operationName = operation;
            this.cost = cost;
        }

        public override string ToString()
        {
            return $"Operation: {operationName} Cost: {cost}";
        }
    }
}
