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
    public class EfGetWritersQuery : IGetWritersQuery
    {
        private readonly MovieContext _context;

        public EfGetWritersQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Get Writers";

        public PagedResponse<WriterDto> Execute(WriterSearch search)
        {
            var query = _context.Writers.Include(x => x.WriterMovies)
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
            if(search.Oscars != null)
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

            var response = new PagedResponse<WriterDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(w => new WriterDto
                             {
                                 Id = w.Id,
                                 FirstName = w.FirstName,
                                 LastName = w.LastName,
                                 FullName = w.FirstName + " " + w.LastName,
                                 Oscars = w.Oscars ?? 0,
                                 MovieNumber = w.MovieNumber,
                                 WriterMovies = w.WriterMovies.Select(wm => new WriterMovieDto
                                 {
                                     Id = wm.MovieId,
                                     Title = wm.Movie.Title,
                                     Oscars = wm.Movie.Oscars ?? 0,
                                     Genre = wm.Movie.Genre.Name,
                                     Price = wm.Movie.Price,
                                     Year = wm.Movie.Year
                                 })
                             })
            };
            return response;
        }
    }
}
