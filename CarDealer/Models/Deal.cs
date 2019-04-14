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
        private float discountedPrice;

        public int Id { get; set; }
        public CarInventory Car { get; set; }
        public string CarBrand { get; set; }
        public string CarModel { get; set; }
        public List<IClient> Clients { get; set; }
        private List<Deal> latestDeals { get; set; }

        public float DiscountedPrice { get; set; }

        public Deal() { }

        public Deal(int id, CarInventory car, float discountPrice)
        {
            Id = id;
            Car = car;
            discountedPrice = discountPrice;
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

        public List<Deal> GetLatestDeals()
        {
            return latestDeals;
        }

        public void AddDeal(Deal deal)
        {
            if (latestDeals == null)
                latestDeals = new List<Deal>();
            latestDeals.Add(deal);
        }

        public override string ToString()
        {
            return $"Car:{Environment.NewLine}{Car}{Environment.NewLine}Discounted price: {DiscountedPrice}";
        }
    }
}
