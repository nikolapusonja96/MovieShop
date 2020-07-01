using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class Actor : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FirstAndLastName { get; set; }
        public DateTime Birth { get; set; }
        public string BirthPlace { get; set; }
        public int Age { get; set; }
        public int? Oscars { get; set; }
        public int MoviesNumber { get; set; }
        

        public virtual ICollection<ActorMovie> ActorMovies { get; set; } = new HashSet<ActorMovie>();
    }
}
