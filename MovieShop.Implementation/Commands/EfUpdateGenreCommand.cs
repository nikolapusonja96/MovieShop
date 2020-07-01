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
    public class EfUpdateGenreCommand : IUpdateGenreCommand
    {
        private readonly UpdateGenreValidator _validator;
        private readonly MovieContext _context;

        public EfUpdateGenreCommand(UpdateGenreValidator validator, MovieContext context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id => 3;

        public string Name => "Update Genre";

        public void Execute(GenreDto request)
        {
            _validator.ValidateAndThrow(request);

            var genre = _context.Genres.Find(request.Id);

            if (genre == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Genre));
            }

            genre.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
