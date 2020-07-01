using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class CreateWriterDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Fullname => FirstName + " " + LastName;
        public int Oscars { get; set; }
        public int MovieNumber => WriterMovies.Count();
        public IEnumerable<CreateWriterMovieDto> WriterMovies { get; set; } = new List<CreateWriterMovieDto>();
    }

    public class CreateWriterMovieDto
    {
        public int MovieId { get; set; }
        public string MovieTitle { get; set; }
    }
}