using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class MovieSearch : PagedSearch
    {
        public string Title { get; set; }
        public string Genre { get; set; }
        public int? Oscars { get; set; }
        public int? MinOscars { get; set; }
        public int? MaxOscars { get; set; }
        public int? Price { get; set; }
        public int? MinPrice { get; set; }
        public int? MaxPrice { get; set; }
        public int? Year { get; set; }
        public int? MinYear { get; set; }
        public int? MaxYear { get; set; }
    }
}
