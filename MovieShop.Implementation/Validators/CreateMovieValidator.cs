using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateMovieValidator :AbstractValidator<CreateMovieDto>
    {
        private readonly MovieContext _context;
        public CreateMovieValidator(MovieContext context)
        {
            this._context = context;

            RuleFor(x => x.Title)
                .NotEmpty()
                .WithMessage("Movie title cannot be empty");

            RuleFor(x => x.GenreId)
                .Must(GenreExists)
                .WithMessage("Genre with an id of {PropertyValue} does not exists in db");

            RuleFor(x => x.Year)
                .LessThanOrEqualTo(DateTime.Now.Year)
                .WithMessage("Movie Year can't be in future");

            RuleFor(x => x.Price)   
                .NotEmpty()
                .WithMessage("Price cannot be empty")
                .GreaterThan(0)
                .WithMessage("Price must be greater than 0");

            RuleFor(x => x.Budget)
                .NotEmpty()
                .WithMessage("Movie budget cannot be empty")
                .GreaterThan(0)
                .WithMessage("Movie budget must be greater than 0");

            RuleFor(x => x.Description)
                .NotEmpty()
                .WithMessage("Movie description must be entered");
            
            RuleFor(x => x.Quantity)
                .NotEmpty()
                .WithMessage("Quantity cannot be empty")
                .GreaterThanOrEqualTo(0)
                .WithMessage("Quantity must be equal or above 0");

            RuleFor(x => x.MovieActors)
                .NotEmpty()
                .WithMessage("There must be at least 1 movie actor")
                .Must(i => i.Select(x => x.ActorId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate actors are not allowed")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.MovieActors)
                    .SetValidator(new CreateMovieActorValidator(context));
                });

            RuleFor(x => x.MovieDirectors)
                .NotEmpty()
                .WithMessage("There must be at least 1 movie director")
                .Must(i => i.Select(x => x.DirectorId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate directors are not allowed")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.MovieDirectors)
                    .SetValidator(new CreateMovieDirectorValidator(context));
                });

            RuleFor(x => x.MovieWriters)
                .NotEmpty()
                .WithMessage("There must be at least 1 movie writer")
                .Must(i => i.Select(x => x.WriterId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate writers are not allowed")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.MovieWriters)
                    .SetValidator(new CreateMovieWriterValidator(context));
                });
        }

        private bool GenreExists(int genreId)
        {
            return _context.Genres.Any(x => x.Id == genreId);
        }
    }
}
