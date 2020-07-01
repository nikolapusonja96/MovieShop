using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class ActorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string BirthPlace { get; set; }
        public int Age { get; set; }
        public int Oscars { get; set; }
        public int MovieNumber { get; set; }
        public IEnumerable<ActorMovieDto> ActorMovies { get; set; } = new List<ActorMovieDto>();
    }

    public class ActorMovieDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ActorCharacterName { get; set; }
        public int Oscars { get; set; }
        public decimal Price { get; set; }
        public string Genre { get; set; }
        public int Year { get; set; }
    }
}
