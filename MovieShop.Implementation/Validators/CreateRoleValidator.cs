using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateRoleValidator : AbstractValidator<RoleDto>
    {
        public CreateRoleValidator(MovieContext context)
        {
            RuleFor(x => x.Name)
               .Must(name => !context.Roles.Any(g => g.Name == name))
               .WithMessage("Role name must be unique");
        }
    }
}
