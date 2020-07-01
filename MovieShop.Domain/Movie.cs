using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class Movie : BaseEntity
    {
        public string Title { get; set; }
        public decimal Budget { get; set; }
        public string Description { get; set; }
        public int Year { get; set; }
        public int? Oscars { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int GenreId { get; set; }

        public virtual Genre Genre { get; set; }
        public virtual ICollection<ActorMovie> MovieActors { get; set; } = new HashSet<ActorMovie>();
        public virtual ICollection<DirectorMovie> MovieDirectors { get; set; } = new HashSet<DirectorMovie>();
        public virtual ICollection<WriterMovie> MovieWriters { get; set; } = new HashSet<WriterMovie>();
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();

    }
}
