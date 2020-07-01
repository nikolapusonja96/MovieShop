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
    public class EfUpdateDirectorCommand : IUpdateDirectorCommand
    {
        private readonly MovieContext _context;
        private readonly UpdateDirectorValidator _validator;

        public EfUpdateDirectorCommand(MovieContext context, UpdateDirectorValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 18;

        public string Name => "Update Director";

        public void Execute(UpdateDirectorDto request)
        {
            _validator.ValidateAndThrow(request);

            var director = _context.Directors.Find(request.Id);

            if (director == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Director));
            }


            if (request.FirstName == null && request.LastName == null)
            {
                request.FirstName = director.FirstName;
                request.LastName = director.LastName;
            }

            if (request.FirstName == null && request.LastName != null)
            {
                request.FirstName = director.FirstName;
            }

            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = director.LastName;
            }

            var oscars = director.Oscars;

            director.LastName = request.LastName;
            director.FirstName = request.FirstName;
            director.Fullname = request.FullName;
            director.Oscars = request.Oscars ?? oscars;

            _context.SaveChanges();
        }
    }
}
