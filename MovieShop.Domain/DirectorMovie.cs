using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class DirectorMovie : BaseManyToMany
    {
        public int DirectorId { get; set; }
        public int MovieId { get; set; }

        public virtual Movie Movie { get; set; }
        public virtual Director Director { get; set; }
    }
}
