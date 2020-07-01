using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class DirectorDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public int Oscars { get; set; }
        public int MovieNumber { get; set; }

        public virtual IEnumerable<DirectorMovieDto> DirectorMovies { get; set; } = new List<DirectorMovieDto>();
    }
    public class DirectorMovieDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int Oscars { get; set; }
        public decimal Price { get; set; }
        public string Genre { get; set; }
        public int Year { get; set; }
    }
}
