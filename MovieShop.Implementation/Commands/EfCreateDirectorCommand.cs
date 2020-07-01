using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfCreateDirectorCommand : ICreateDirectorCommand
    {
        private readonly MovieContext _context;
        private readonly CreateDirectorValidator _validator;

        public EfCreateDirectorCommand(MovieContext context, CreateDirectorValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "Create Director";

        public void Execute(CreateDirectorDto request)
        {
            _validator.ValidateAndThrow(request);
            var director = new Director
            {
                Id = request.Id,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Oscars = request.Oscars,
                MovieNumber = request.MovieNumber,
                Fullname = request.Fullname
            };

            foreach (var item in request.DirectorMovies)
            {
                director.DirectorMovies.Add(new DirectorMovie
                {
                    MovieId = item.MovieId,
                    DirectorId = director.Id
                });
            }
            _context.Directors.Add(director);
            _context.SaveChanges();
        }
    }
}
