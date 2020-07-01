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
    public class UpdateMovieValidator : AbstractValidator<UpdateMovieDto>
    {
        
        public UpdateMovieValidator(MovieContext context)
        {
            RuleFor(x => x.Title)
                .Must((dto, title) => !context.Movies.Any(m => m.Title == title && m.Id != dto.Id))
                .WithMessage(m=> $"Movie ({m.Title}) already exists in database");
        }
    }
}
