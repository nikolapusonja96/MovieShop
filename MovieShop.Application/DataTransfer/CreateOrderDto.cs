using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class CreateOrderDto
    {
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public int UserId { get; set; }
        public IEnumerable<CreateOrderLineDto> Items { get; set; } = new List<CreateOrderLineDto>();
    }
    public class CreateOrderLineDto
    {
        public int MovieId { get; set; }
        public int Quantity { get; set; }
    }
}
