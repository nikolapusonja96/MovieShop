using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public DateTime? Date { get; set; }
        public int? MinOrderLines { get; set; }
        public int? MaxPrice { get; set; }
        public int? MinPrice { get; set; }
        public int? userId { get; set; }
    }
}
