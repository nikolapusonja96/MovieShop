using Microsoft.EntityFrameworkCore;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetActorsQuery : IGetActorsQuery
    {
        private readonly MovieContext _context;
        
        public EfGetActorsQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 14;

        public string Name => "Get Actors";

        public PagedResponse<ActorDto> Execute(ActorSearch search)
        {
            var query = _context.Actors.Include(x => x.ActorMovies)
                                       .ThenInclude(m => m.Movie)
                                       .ThenInclude(g => g.Genre)
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

            if (!string.IsNullOrEmpty(search.BirthPlace) || !string.IsNullOrWhiteSpace(search.BirthPlace))
            {
                query = query.Where(x => x.BirthPlace.ToLower().Contains(search.BirthPlace.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Movie) || !string.IsNullOrWhiteSpace(search.Movie))
            {
                query = query.Where(x => x.ActorMovies.Select(am => am.Movie.Title.ToLower()).Contains(search.Movie.ToLower()));
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
                query = query.Where(x => x.MoviesNumber == search.Movies);
            }
            if (search.MinMovies != null)
            {
                query = query.Where(x => x.MoviesNumber >= search.MinMovies);
            }
            if (search.MaxMovies != null)
            {
                query = query.Where(x => x.MoviesNumber <= search.MaxMovies);
            } 
            if(search.Age != null)
            {
                query = query.Where(x => x.Age == search.Age);
            }
            if (search.MinAge != null)
            {
                query = query.Where(x => x.Age >= search.MinAge);
            }
            if (search.MaxAge != null)
            {
                query = query.Where(x => x.Age <= search.MaxAge);
            }
            #endregion

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<ActorDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(a => new ActorDto
                             {
                                 Id = a.Id,
                                 FirstName = a.FirstName,
                                 LastName = a.LastName,
                                 BirthPlace = a.BirthPlace,
                                 Age = a.Age,
                                 Oscars = a.Oscars ?? 0,
                                 FullName = a.FirstName + " " + a.LastName,
                                 MovieNumber = a.ActorMovies.Count(),
                                 ActorMovies = a.ActorMovies.Select(am => new ActorMovieDto
                                 {
                                     Id = am.MovieId,
                                     Name = am.Movie.Title,
                                     ActorCharacterName = am.ActorCharachterName,
                                     Oscars = am.Movie.Oscars ?? 0,
                                     Price = am.Movie.Price,
                                     Year = am.Movie.Year,
                                     Genre = am.Movie.Genre.Name
                                 })
                             })
            };
            return response;
        }
    }
}
