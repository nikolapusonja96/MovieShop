using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class CreateDirectorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Fullname => FirstName + " " + LastName;
        public int Oscars { get; set; }
        public int MovieNumber => DirectorMovies.Count();
        public IEnumerable<CreateDirectorMovieDto> DirectorMovies { get; set; } = new List<CreateDirectorMovieDto>();
    }

    public class CreateDirectorMovieDto
    {
        public int MovieId { get; set; }
    }
}
