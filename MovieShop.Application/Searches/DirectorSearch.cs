using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class DirectorSearch : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? Oscars { get; set; }
        public int? MinOscars { get; set; }
        public int? MaxOscars { get; set; }
        public int? Movies { get; set; }
        public int? MinMovies { get; set; }
        public int? MaxMovies { get; set; }
    }
}
