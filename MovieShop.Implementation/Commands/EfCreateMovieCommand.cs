using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfCreateMovieCommand : ICreateMovieCommand
    {
        private readonly MovieContext _context;
        private readonly CreateMovieValidator _validator;

        public EfCreateMovieCommand(MovieContext context, CreateMovieValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 21;

        public string Name => "Create Movie";

        public void Execute(CreateMovieDto request)
        {
            
            _validator.ValidateAndThrow(request);

            var movie = new Movie
            {
                Budget = request.Budget,
                Description = request.Description,
                Title = request.Title,
                Price = request.Price,
                Quantity = request.Quantity,
                GenreId = request.GenreId,
                Oscars = request.Oscars,
                Year = request.Year
            };

            //add into ActorMovie
            foreach (var item in request.MovieActors)
            {
                movie.MovieActors.Add(new ActorMovie
                {
                    MovieId = movie.Id,
                    ActorId = item.ActorId,
                    ActorCharachterName = item.ActorCharacterName
                });
            }

            //DirectorMovie
            foreach (var item in request.MovieDirectors)
            {
                movie.MovieDirectors.Add(new DirectorMovie
                {
                    MovieId = movie.Id,
                    DirectorId = item.DirectorId
                });
            }
            //WriterMovie
            foreach (var item in request.MovieWriters)
            {
                movie.MovieWriters.Add(new WriterMovie
                {
                    MovieId = movie.Id,
                    WriterId = item.WriterId
                });
            }

            _context.Movies.Add(movie);
            _context.SaveChanges();
        }
    }
}
