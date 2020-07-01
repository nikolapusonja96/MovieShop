using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class CreateActorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Birth { get; set; }
        public string FullName => FirstName + " " + LastName;
        public string BirthPlace { get; set; }
        public int Age { get; set; }
        public int Oscars { get; set; }
        public int MovieNumber => ActorMovies.Count();
        public IEnumerable<CreateActorMovieDto> ActorMovies { get; set; } = new List<CreateActorMovieDto>();
    }
    public class CreateActorMovieDto
    {
        public int MovieId { get; set; }
        public string ActorCharacterName { get; set; }
    }
}
