using Microsoft.EntityFrameworkCore;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetDirectorsQuery : IGetDirectorsQuery
    {
        private readonly MovieContext _context;

        public EfGetDirectorsQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Name => "Get Directors";

        public PagedResponse<DirectorDto> Execute(DirectorSearch search)
        {
            var query = _context.Directors.Include(x => x.DirectorMovies)
                                        .ThenInclude(x => x.Movie)
                                        .ThenInclude(x => x.Genre)
                                        .AsQueryable();
            
            #region Filters
            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }
            if (search.Oscars != null)
            {
                query = query.Where(x => x.Oscars == search.Oscars);
            }
            if (search.MinOscars != null)
            {
                query = query.Where(x => x.Oscars >= search.MinOscars);
            }
            if (search.MaxOscars != null)
            {
                query = query.Where(x => x.Oscars <= search.MaxOscars);
            }
            if (search.Movies != null)
            {
                query = query.Where(x => x.MovieNumber == search.Movies);
            }
            if (search.MinMovies != null)
            {
                query = query.Where(x => x.MovieNumber >= search.MinMovies);
            }
            if (search.MaxMovies != null)
            {
                query = query.Where(x => x.MovieNumber <= search.MaxMovies);
            }

            #endregion

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<DirectorDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(d => new DirectorDto
                             {
                                 Id = d.Id,
                                 FirstName = d.FirstName,
                                 LastName = d.LastName,
                                 FullName = d.FirstName + " " + d.LastName,
                                 Oscars = d.Oscars ?? 0,
                                 MovieNumber = d.MovieNumber,
                                 DirectorMovies = d.DirectorMovies.Select(dm => new DirectorMovieDto
                                 {
                                     Id = dm.MovieId,
                                     Title = dm.Movie.Title,
                                     Oscars = dm.Movie.Oscars ?? 0,
                                     Genre = dm.Movie.Genre.Name,
                                     Price = dm.Movie.Price,
                                     Year = dm.Movie.Year
                                 })
                             })
            };
            return response;
        }
    }
}
