using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class MovieDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public decimal Budget { get; set; }
        public string Description { get; set; }
        public int Year { get; set; }
        public int Oscars { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public string Genre { get; set; }
        
        public IEnumerable<MovieActorDto> MovieActors { get; set; } = new List<MovieActorDto>();
        public IEnumerable<MovieDirectorDto> MovieDirectors { get; set; } = new List<MovieDirectorDto>();
        public IEnumerable<MovieWriterDto> MovieWriters { get; set; } = new List<MovieWriterDto>();
    }

    public class MovieActorDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Oscars { get; set; }
    }
    public class MovieDirectorDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Oscars { get; set; }
    }
    public class MovieWriterDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Oscars { get; set; }
    }
}
