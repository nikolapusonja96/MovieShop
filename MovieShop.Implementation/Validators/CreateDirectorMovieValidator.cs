using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateDirectorMovieValidator : AbstractValidator<CreateDirectorMovieDto>
    {
        private readonly MovieContext _context;
        public CreateDirectorMovieValidator(MovieContext context)
        {
            _context = context;
            RuleFor(x => x.MovieId)
                   .Must(MovieExists)
                   .WithMessage("Movie with an id of {PropertyValue} does not exists in db");
        }
        private bool MovieExists(int movieId)
        {
            return _context.Movies.Any(x => x.Id == movieId);
        }
    }
}
    