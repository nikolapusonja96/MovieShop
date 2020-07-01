
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
    public class EfGetSingleWriterQuery : IGetSingleWriterQuery
    {
        private readonly MovieContext _context;

        public EfGetSingleWriterQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 10;

        public string Name => "Get Single Writer";

        public WriterDto Execute(int search)
        {
            var query = _context.Writers.Include(x => x.WriterMovies)
                                        .ThenInclude(x => x.Movie)
                                        .ThenInclude(x => x.Genre)
                                        .AsQueryable();
            var writer = query.FirstOrDefault(a => a.Id == search);

            if (writer == null)
            {
                throw new EntityNotFoundException(search, typeof(Writer));
            }
            var response = new WriterDto
            {
                Id = writer.Id,
                FirstName = writer.FirstName,
                LastName = writer.LastName,
                Oscars = writer.Oscars ?? 0,
                FullName = writer.FirstName + " " + writer.LastName,
                MovieNumber = writer.WriterMovies.Count(),
                WriterMovies = writer.WriterMovies.Select(x => new WriterMovieDto
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
