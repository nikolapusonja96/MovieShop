using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Domain
{
    public class ActorMovie : BaseManyToMany
    {
        public int ActorId { get; set; }
        public int MovieId { get; set; }
        public string ActorCharachterName { get; set; }

        public virtual Actor Actor { get; set; }
        public virtual Movie Movie { get; set; }
    }
}
