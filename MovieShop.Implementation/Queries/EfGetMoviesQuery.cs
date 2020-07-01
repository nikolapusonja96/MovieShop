using Microsoft.EntityFrameworkCore;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetMoviesQuery : IGetMoviesQuery
    {
        private readonly MovieContext _context;

        public EfGetMoviesQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 24;

        public string Name => "Get Movies";

        public PagedResponse<MovieDto> Execute(MovieSearch search)
        {
            var query = _context.Movies.Include(x => x.MovieActors)
                                        .ThenInclude(x => x.Actor)
                                        .Include(x => x.MovieDirectors)
                                        .ThenInclude(x => x.Director)
                                        .Include(x => x.MovieWriters)
                                        .ThenInclude(x => x.Writer)
                                        .Include(x => x.Genre)
                                        .AsQueryable();

            #region Filters
            if (!string.IsNullOrEmpty(search.Title) || !string.IsNullOrWhiteSpace(search.Title))
            {
                query = query.Where(x => x.Title.ToLower().Contains(search.Title.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Genre) || !string.IsNullOrWhiteSpace(search.Genre))
            {
                query = query.Where(x => x.Genre.Name.ToLower().Contains(search.Genre.ToLower()));
            }

            if (search.Year != null)
            {
                query = query.Where(x => x.Year == search.Year);
            }
            if (search.MinYear != null)
            {
                query = query.Where(x => x.Year >= search.MinYear);
            }
            if (search.MaxYear != null)
            {
                query = query.Where(x => x.Year <= search.MaxYear);
            }

            if (search.Price != null)
            {
                query = query.Where(x => x.Price == search.Price);
            }
            if (search.MinPrice != null)
            {
                query = query.Where(x => x.Price >= search.MinPrice);
            }
            if (search.MaxPrice != null)
            {
                query = query.Where(x => x.Price <= search.MaxPrice);
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
            #endregion

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<MovieDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(m => new MovieDto
                             {
                                 Id = m.Id,
                                 Title = m.Title,
                                 Year = m.Year,
                                 Budget = m.Budget,
                                 Genre = m.Genre.Name,
                                 Description = m.Description,
                                 Oscars = m.Oscars ?? 0,
                                 Price = m.Price,
                                 Quantity = m.Quantity,
                                 MovieActors = m.MovieActors.Select(ma => new MovieActorDto
                                 {
                                     Id = ma.ActorId,
                                     Name = ma.Actor.FirstAndLastName,
                                     Oscars = ma.Actor.Oscars ?? 0,
                                 }),
                                 MovieDirectors = m.MovieDirectors.Select(md=> new MovieDirectorDto
                                 {
                                     Id = md.DirectorId,
                                     Name = md.Director.Fullname,
                                     Oscars = md.Director.Oscars ?? 0
                                 }),
                                 MovieWriters = m.MovieWriters.Select(mw=>new MovieWriterDto
                                 {
                                     Id = mw.WriterId,
                                     Name = mw.Writer.Fullname,
                                     Oscars = mw.Writer.Oscars ?? 0
                                 })
                             })
            };
            return response;
        }
    }
}
