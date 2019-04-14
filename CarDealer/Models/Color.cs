using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    [Serializable] class Color
    {
        private int id;
        private string colorName;

        public int Id { get => id; set => id = value; }
        public string ColorName { get => colorName; set => colorName = value; }

        public Color(int id, string color)
        {
            this.id = id;
            this.colorName = color;
        }

        public override string ToString()
        {
            return $"Color: {colorName}";
        }
    }
}
