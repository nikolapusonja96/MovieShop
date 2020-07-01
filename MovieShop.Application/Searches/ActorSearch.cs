using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class ActorSearch : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int? Oscars { get; set; }
        public int? MinOscars { get; set; }
        public int? MaxOscars { get; set; }
        public int? Movies { get; set; }
        public int? MinMovies { get; set; }
        public int? MaxMovies { get; set; }
        public string BirthPlace { get; set; }
        public int? Age { get; set; }
        public int? MinAge { get; set; }
        public int? MaxAge { get; set; }
        public string Movie { get; set; }
    }
}
