using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UpdateActorValidator : AbstractValidator<UpdateActorDto>
    {
        public UpdateActorValidator(MovieContext context)
        {
            RuleFor(x => x.FullName)
                .Must((dto, fullname) => !context.Actors.Any(a => a.FirstAndLastName == fullname && a.Id != dto.Id))
                .WithMessage(a => $"Actor ({a.FullName}) already exists in database");
            
        }
    }
}
