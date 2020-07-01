using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UpdateDirectorValidator : AbstractValidator<UpdateDirectorDto>
    {
        public UpdateDirectorValidator(MovieContext context)
        {
            RuleFor(x => x.FullName)
                .Must((dto, fullname) => !context.Directors.Any(d => d.Fullname == fullname && d.Id != dto.Id))
                .WithMessage(d => $"Director ({d.FullName}) already exists in database");
        }
    }
}
