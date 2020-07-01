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
    public class EfGetSingleDirectorQuery : IGetSingleDirectorQuery
    {
        private readonly MovieContext _context;

        public EfGetSingleDirectorQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 20;

        public string Name => "Get Single director";

        public DirectorDto Execute(int search)
        {
            var query = _context.Directors.Include(x => x.DirectorMovies)
                                        .ThenInclude(x => x.Movie)
                                        .ThenInclude(x => x.Genre)
                                        .AsQueryable();
            var director = query.FirstOrDefault(d => d.Id == search);

            if (director == null)
            {
                throw new EntityNotFoundException(search, typeof(Director));
            }
            var response = new DirectorDto
            {
                Id = director.Id,
                FirstName = director.FirstName,
                LastName = director.LastName,
                Oscars = director.Oscars ?? 0,
                FullName = director.FirstName + " " + director.LastName,
                MovieNumber = director.DirectorMovies.Count(),
                DirectorMovies = director.DirectorMovies.Select(x => new DirectorMovieDto
                {
                    Id = x.MovieId,
                    Genre = x.Movie.Genre.Name,
                    Title = x.Movie.Title,
                    Price = x.Movie.Price,
                    Oscars = x.Movie.Oscars ?? 0,
                    Year = x.Movie.Year
                })
            };
            return response;
        }
    }
}
