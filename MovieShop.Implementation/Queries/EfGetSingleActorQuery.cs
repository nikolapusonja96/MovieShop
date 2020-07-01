using Microsoft.EntityFrameworkCore;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.Application.Queries;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetSingleActorQuery : IGetSingleActorQuery
    {
        private readonly MovieContext _context;

        public EfGetSingleActorQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 15;

        public string Name => "Get Single Actor";

        public ActorDto Execute(int search)
        {
            var query = _context.Actors.Include(x => x.ActorMovies)
                                       .ThenInclude(a => a.Movie)
                                       .ThenInclude(x => x.Genre)
                                       .AsQueryable();

            var actor = query.FirstOrDefault(a=> a.Id ==search);

            if (actor == null)
            {
                throw new EntityNotFoundException(search, typeof(Actor));
            }

            var response = new ActorDto
            {
                Id = actor.Id,
                FirstName = actor.FirstName,
                LastName = actor.LastName,
                BirthPlace = actor.BirthPlace,
                Age = actor.Age,
                Oscars = actor.Oscars ?? 0,
                FullName = actor.FirstName + " " + actor.LastName,
                MovieNumber = actor.ActorMovies.Count(),
                ActorMovies = actor.ActorMovies.Select(x => new ActorMovieDto
                {
                    Id = x.MovieId,
                    Genre = x.Movie.Genre.Name,
                    Name = x.Movie.Title,
                    Price = x.Movie.Price,
                    Oscars = x.Movie.Oscars ?? 0,
                    Year = x.Movie.Year,
                    ActorCharacterName = x.ActorCharachterName
                })
            };
            return response;
        }
    }
}
