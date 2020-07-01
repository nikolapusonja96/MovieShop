using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateOrderLineValidator : AbstractValidator<CreateOrderLineDto>
    {
        private readonly MovieContext _context;
        public CreateOrderLineValidator(MovieContext context)
        {
            _context = context;

            RuleFor(x => x.MovieId)
              .Must(MovieExists)
              .WithMessage("Movie with an id of {PropertyValue} does not exists")
              .DependentRules(() =>  
                {
                  RuleFor(x => x.Quantity)
                  .GreaterThan(0)
                  .WithMessage("Quantity must be greater than 0")
                  .Must(QuantityDoesntExceedDtoQuantity)
                  .WithMessage("Defined Quantity ({PropertyValue}) is unavailable.");
              });
        }

        private bool MovieExists(int movieId)
        {
            return _context.Movies.Any(x => x.Id == movieId);
        }
        private bool QuantityDoesntExceedDtoQuantity(CreateOrderLineDto dto, int quantity)
        {
            return _context.Movies.Find(dto.MovieId).Quantity >= quantity;
        }
    }
}
