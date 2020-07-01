using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class Order : BaseEntity
    {
        public DateTime OrderDate { get; set; }
        public string Address { get; set; }
        public int UserId { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
    }
}
