using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateGenreValidator : AbstractValidator<GenreDto>
    {
        public CreateGenreValidator(MovieContext context)
        {
            RuleFor(x => x.Name)
                .Must(name => !context.Genres.Any(g => g.Name == name))
                .WithMessage("Genre name must be unique");
        }
    }
}
