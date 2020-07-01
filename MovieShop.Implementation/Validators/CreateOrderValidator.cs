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
    public class CreateOrderValidator : AbstractValidator<CreateOrderDto>
    {
        private readonly MovieContext _context;
        public CreateOrderValidator(MovieContext context)
        {
            this._context = context;

            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Order address cannot be empty");

            RuleFor(x => x.OrderDate)
               .GreaterThan(DateTime.Now)
               .WithMessage("Order date must be in the future")
               .LessThan(DateTime.Now.AddDays(14))
               .WithMessage("Order date must be less than 14 days from today's date");
            
            
            RuleFor(x => x.Items)
              .NotEmpty()
              .WithMessage("There must be at least 1 oder line")
              .Must(i => i.Select(x => x.MovieId).Distinct().Count() == i.Count()) 
              .WithMessage("Duplicate Movies are not allowed")
              .DependentRules(() =>
              {
                  RuleForEach(x => x.Items)
                  .SetValidator(new CreateOrderLineValidator(_context));
                });
        }
        private bool UserExists(int userId)
        {
            return _context.Users.Any(x => x.Id == userId);
        }
    }
}
