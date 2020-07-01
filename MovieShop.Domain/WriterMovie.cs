using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class WriterMovie : BaseManyToMany
    {
        public int WriterId { get; set; }
        public int MovieId { get; set; }

        public virtual Writer Writer { get; set; }
        public virtual Movie Movie { get; set; }
    }
}
