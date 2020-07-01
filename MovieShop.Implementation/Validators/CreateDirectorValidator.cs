using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateDirectorValidator : AbstractValidator<CreateDirectorDto>
    {
        public CreateDirectorValidator(MovieContext context)
        {
            RuleFor(x => x.FirstName)
               .NotEmpty()
               .WithMessage("First name cannot be empty, please enter Director's first name");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name cannot be empty, please enter Director's last name");

            RuleFor(x => x.Fullname)
                .Must((dto, fullname) => !context.Directors.Any(d => d.Fullname == fullname && d.Id != dto.Id))
                .WithMessage(d => $"Director ({d.Fullname}) already exists in database");

            RuleFor(x => x.DirectorMovies)
               .NotEmpty()
               .WithMessage("There must be at least 1 director's movie")
               .Must(i => i.Select(x => x.MovieId).Distinct().Count() == i.Count())
               .WithMessage("Duplicate movies are not allowed")
               .DependentRules(() =>
               {
                   RuleForEach(x => x.DirectorMovies)
                   .SetValidator(new CreateDirectorMovieValidator(context));
               });
        }
    }
}
