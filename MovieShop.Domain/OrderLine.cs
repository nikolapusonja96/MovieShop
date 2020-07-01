using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class OrderLine : BaseEntity
    {
        public string Title { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public int OrderId { get; set; }
        public int? MovieId { get; set; }

        public virtual Order Order { get; set; }
        public virtual Movie Movie { get; set; }
    }
}
