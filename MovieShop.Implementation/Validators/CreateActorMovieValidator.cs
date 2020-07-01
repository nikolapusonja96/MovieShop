using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateActorMovieValidator : AbstractValidator<CreateActorMovieDto>
    {
        private readonly MovieContext context;
        public CreateActorMovieValidator(MovieContext context)
        {
            this.context = context;
            RuleFor(x => x.MovieId)
                .Must(MovieExists)
                .WithMessage("Movie with an id of {PropertyValue} does not exists in db")
                .DependentRules(() =>
                {
                    RuleFor(x => x.ActorCharacterName)
                    .NotEmpty()
                    .WithMessage("Actor character in movie can not be empty");
                });
        }
        private bool MovieExists(int movieId)
        {
            return context.Movies.Any(x => x.Id == movieId);
        }
    }
}

