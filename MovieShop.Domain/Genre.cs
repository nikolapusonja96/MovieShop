using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class Genre : BaseEntity
    {
        public string Name { get; set; }

        public virtual ICollection<Movie> Movies { get; set; }
    }
}
