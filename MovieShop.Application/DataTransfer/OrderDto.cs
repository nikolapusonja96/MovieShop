using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class OrderDto
    {
        public int Id { get; set; }
        public string Address { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UserFullname { get; set; }
        public IEnumerable<OrderLineDto> OrderLines { get; set; } = new List<OrderLineDto>();
        public decimal TotalPrice => OrderLines.Sum(x => x.Price * x.Quantity);        
    }
    public class OrderLineDto
    {
            public int Id { get; set; }
            public string Title { get; set; }
            public decimal Price { get; set; }
            public int Quantity { get; set; }
    }
}
