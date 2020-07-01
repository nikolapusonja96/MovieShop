using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace MovieShop.Implementation.Validators
{
    public class UpdateGenreValidator : AbstractValidator<GenreDto>
    {
        public UpdateGenreValidator(MovieContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Name is required parameter")
               .Must((dto, name) => !context.Genres.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage(g => $"Genre with name {g.Name} already exists in db.");
        }
    }
}
