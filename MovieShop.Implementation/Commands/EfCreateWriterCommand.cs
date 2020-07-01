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
    public class EfCreateWriterCommand : ICreateWriterCommand
    {
        private readonly MovieContext _context;
        private readonly CreateWriterValidator _validator;

        public EfCreateWriterCommand(MovieContext context, CreateWriterValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Create Writer";

        public void Execute(CreateWriterDto request)
        {
            _validator.ValidateAndThrow(request);

            var writer = new Writer
            {
                Id = request.Id,
                FirstName = request.FirstName,
                LastName = request.LastName,
                Oscars = request.Oscars,
                MovieNumber = request.MovieNumber,
                Fullname = request.Fullname
            };
            //add into n:n
            foreach (var item in request.WriterMovies)
            {

                writer.WriterMovies.Add(new WriterMovie
                {
                    MovieId = item.MovieId,
                    WriterId = writer.Id
                });
            }
            _context.Writers.Add(writer);
            _context.SaveChanges();
        }
    }
}
