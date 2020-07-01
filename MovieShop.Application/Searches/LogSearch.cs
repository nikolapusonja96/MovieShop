using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string Name { get; set; }
        public string ActorName { get; set; }
        public DateTime? MinDate { get; set; }
        public DateTime? MaxDate { get; set; }
        public int? Year { get; set; }
        public int? Month { get; set; }
        public int? Day { get; set; }
    }
}
