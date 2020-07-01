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
    public class EfUpdateWriterCommand : IUpdateWriterCommand
    {
        private readonly UpdateWriterValidator _validator;
        private readonly MovieContext _context;

        public EfUpdateWriterCommand(UpdateWriterValidator validator, MovieContext context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id =>8;

        public string Name => "Update Writer";

        public void Execute(UpdateWriterDto request)
        {
            _validator.ValidateAndThrow(request);

            var writer = _context.Writers.Find(request.Id);

            if(writer == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Writer));
            }


            if (request.FirstName == null && request.LastName == null)
            {
                request.FirstName = writer.FirstName;
                request.LastName = writer.LastName;
            }

            if (request.FirstName == null && request.LastName != null)
            {
                request.FirstName = writer.FirstName;
            }

            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = writer.LastName;
            }

            var oscars = writer.Oscars;

            writer.LastName = request.LastName;
            writer.FirstName = request.FirstName;
            writer.Fullname = request.FullName;
            writer.Oscars = request.Oscars ?? oscars;

            _context.SaveChanges();
        }
    }
}
