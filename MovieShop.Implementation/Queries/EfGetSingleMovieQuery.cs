using Microsoft.EntityFrameworkCore;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.Application.Queries;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetSingleMovieQuery : IGetSingleMovieQuery
    {
        private readonly MovieContext _context;

        public EfGetSingleMovieQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 25;

        public string Name => "Get single movie";

        public MovieDto Execute(int search)
        {
            var query = _context.Movies.Include(x => x.MovieActors)
                                       .ThenInclude(x => x.Actor)
                                       .Include(x => x.MovieDirectors)
                                       .ThenInclude(x => x.Director)
                                       .Include(x => x.MovieWriters)
                                       .ThenInclude(x => x.Writer)
                                       .Include(x => x.Genre)
                                       .AsQueryable();

            var movie = query.FirstOrDefault(m => m.Id == search);

            if (movie == null)
            {
                throw new EntityNotFoundException(search, typeof(Movie));
            }
            var response = new MovieDto
            {
                Id = movie.Id,
                Title = movie.Title,
                Year = movie.Year,
                Budget = movie.Budget,
                Genre = movie.Genre.Name,
                Description = movie.Description,
                Oscars = movie.Oscars ?? 0,
                Price = movie.Price,
                Quantity = movie.Quantity,
                MovieActors = movie.MovieActors.Select(ma => new MovieActorDto
                {
                    Id = ma.ActorId,
                    Name = ma.Actor.FirstAndLastName,
                    Oscars = ma.Actor.Oscars ?? 0,
                }),
                MovieDirectors = movie.MovieDirectors.Select(md => new MovieDirectorDto
                {
                    Id=md.DirectorId,
                    Name = md.Director.Fullname,
                    Oscars = md.Director.Oscars ?? 0
                }),
                MovieWriters = movie.MovieWriters.Select(mw => new MovieWriterDto
                {
                    Id=mw.WriterId,
                    Name = mw.Writer.Fullname,
                    Oscars = mw.Writer.Oscars ?? 0
                })
            };
                        
            return response;
        }
    }
}
