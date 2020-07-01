using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateActorValidator : AbstractValidator<CreateActorDto>
    {
        public CreateActorValidator(MovieContext context)
        {
            RuleFor(x => x.FullName)
                .Must(fullname => !context.Actors.Any(a => a.FirstAndLastName == fullname))
                .WithMessage("Actor fullname must be unique");

            RuleFor(x => x.BirthPlace)
                .NotEmpty()
                .WithMessage("Birth Place cannot be empty, please enter Actor's birth place");

            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name cannot be empty, please enter Actor's first name");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name cannot be empty, please enter Actor's last name");

            RuleFor(x => x.Birth)
                .LessThan(DateTime.Now)
                .WithMessage("Actor's birth date must be in past");

            RuleFor(x => x.Age)
                .GreaterThan(5)
                .WithMessage("Actor must be above 5 years old");

            RuleFor(x => x.ActorMovies)
                .NotEmpty()
                .WithMessage("There must be at least 1 movie where actor played")
                .Must(i => i.Select(x => x.MovieId).Distinct().Count() == i.Count())
                .WithMessage("Duplicate movies are not allowd")
                .DependentRules(() =>
                {
                    RuleForEach(x => x.ActorMovies)
                    .SetValidator(new CreateActorMovieValidator(context));
                });
                
        }
    }
}
