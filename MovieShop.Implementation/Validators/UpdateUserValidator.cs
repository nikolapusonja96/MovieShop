using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UpdateUserValidator : AbstractValidator<UpdateUserDto>
    {
        
        public UpdateUserValidator(MovieContext context)
        {
            RuleFor(x => x.Fullname)
                .Must((dto, fullname) => !context.Users.Any(u => u.Fullname == fullname && u.Id != dto.Id))
                .WithMessage(u => $"User ({u.Fullname}) already exists in database.");

            RuleFor(x => x.Email)
                .Must((dto, email) => !context.Users.Any(u => u.Email == email && u.Id != dto.Id))
                .WithMessage(u => $"Email ({u.Email}) is taken, try different one. ");
        }
    }
}
