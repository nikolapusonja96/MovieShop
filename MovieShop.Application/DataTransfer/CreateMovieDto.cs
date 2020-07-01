using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class CreateMovieDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public decimal Budget { get; set; }
        public string Description { get; set; }
        public int Year { get; set; }
        public int Oscars { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public int GenreId { get; set; }
        
        public IEnumerable<CreateMovieActorDto> MovieActors { get; set; } = new List<CreateMovieActorDto>();
        public IEnumerable<CreateMovieDirectorDto> MovieDirectors { get; set; } = new List<CreateMovieDirectorDto>();
        public IEnumerable<CreateMovieWriterDto> MovieWriters { get; set; } = new List<CreateMovieWriterDto>();
    }
    public class CreateMovieActorDto
    {
        public int ActorId { get; set; }
        public string ActorCharacterName { get; set; }
    }
    public class CreateMovieDirectorDto
    {
        public int DirectorId { get; set; }
    }
    public class CreateMovieWriterDto
    {
        public int WriterId { get; set; }
        public string WriterName { get; set; }
    }
}
