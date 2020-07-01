using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class Writer : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Fullname { get; set; }
        public int? Oscars { get; set; }
        public int MovieNumber { get; set; }

        public virtual ICollection<WriterMovie> WriterMovies { get; set; } = new HashSet<WriterMovie>();
    }
}
