using CarDealer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealer.Models
{
    class Deal
    {
        private int id;
        private CarInventory car;
        private float discountedPrice;

        public int Id { get => id; set => id = value; }
        public CarInventory Car { get => car; set => car = value; }
        public float DiscountedPrice
        {
            get
            {
                return discountedPrice;
            }
            set
            {
                if (discountedPrice > value)
                {
                    discountedPrice = value;
                    Notify();
                }
            }
        }

        public List<IClient> Clients { get; set; }

        public Deal(int id, CarInventory car)
        {
            this.id = id;
            this.car = car;
            this.discountedPrice = 9999999;
        }

        public override string ToString()
        {
            return $"Car:{Environment.NewLine}{Car}{Environment.NewLine}Discounted price: {DiscountedPrice}";
        }

        public void Attach(IClient client)
        {
            if (Clients == null)
                Clients = new List<IClient>();
            Clients.Add(client);
        }

        public void Detach(IClient client)
        {
            if(Clients.Contains(client) && Clients != null)
                Clients.Remove(client);
        }

        public void Notify()
        {
            if(Clients != null)
                foreach(IClient client in Clients)
                {
                    client.Update(this);
                }
        }
    }
}
