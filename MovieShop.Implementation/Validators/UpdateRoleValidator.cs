using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UpdateRoleValidator : AbstractValidator<RoleDto>
    {
        public UpdateRoleValidator(MovieContext context)
        {
            RuleFor(x => x.Name)
               .NotEmpty()
               .WithMessage("Name is required parameter")
               .Must((dto, name) => !context.Roles.Any(g => g.Name == name && g.Id != dto.Id))
               .WithMessage(g => $"Product with name {g.Name} already exists in db.");
        }
    }
}
