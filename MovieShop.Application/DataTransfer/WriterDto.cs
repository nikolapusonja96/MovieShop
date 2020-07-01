using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class WriterDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public int Oscars { get; set; }
        public int MovieNumber { get; set; }

        public virtual IEnumerable<WriterMovieDto> WriterMovies { get; set; } = new List<WriterMovieDto>();
    }
    public class WriterMovieDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public int Oscars { get; set; }
        public decimal Price { get; set; }
        public string Genre { get; set; }
        public int Year { get; set; }
    }
   
}
