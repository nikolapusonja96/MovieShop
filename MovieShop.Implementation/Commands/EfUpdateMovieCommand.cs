using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfUpdateMovieCommand : IUpdateMovieCommand
    {
        private readonly UpdateMovieValidator _validator;
        private readonly MovieContext _context;

        public EfUpdateMovieCommand(UpdateMovieValidator validator, MovieContext context)
        {
            _validator = validator;
            _context = context;
        }
        public int Id => 23;

        public string Name => "Update Movie";

        public void Execute(UpdateMovieDto request)
        {
            _validator.ValidateAndThrow(request);

            var movie = _context.Movies.Find(request.Id);

            if (movie == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Movie));
            }

            if (request.Price == null)
            {
                request.Price = movie.Price;
            }
            if (request.Oscars == null)
            {
                request.Oscars = movie.Oscars;
            }
            if (request.Quantity == null)
            {
                request.Quantity = movie.Quantity;
            }
            if (request.Year == null)
            {
                request.Year = movie.Year;
            }
            if (request.Budget == null)
            {
                request.Budget = movie.Budget;
            }

            

            movie.Year = (int)request.Year;
            movie.Quantity = (int)request.Quantity;
            movie.Price = (decimal)request.Price;
            movie.Oscars = request.Oscars;
            movie.Description = request.Description ?? movie.Description;
            movie.Title = request.Title ?? movie.Title;
            movie.Budget = (decimal)request.Budget;

            _context.SaveChanges();
        }

    }
}
