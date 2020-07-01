using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
namespace MovieShop.Implementation.Validators
{
    public class CreateWriterValidator : AbstractValidator<CreateWriterDto>
    {
        public CreateWriterValidator(MovieContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name cannot be empty, please enter Writer's first name");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name cannot be empty, please enter Writer's last name");
            
            RuleFor(x => x.Fullname)
                .Must((dto, fullname) => !context.Writers.Any(w => w.Fullname == fullname && w.Id != dto.Id))
                .WithMessage(w => $"Writer ({w.Fullname}) already exists in database");

            RuleFor(x => x.WriterMovies)
               .NotEmpty()
               .WithMessage("There must be at least 1 writer's movie")
               .Must(i => i.Select(x => x.MovieId).Distinct().Count() == i.Count())
               .WithMessage("Duplicate movies are not allowed")
               .DependentRules(() =>
               {
                   RuleForEach(x => x.WriterMovies)
                   .SetValidator(new CreateWriterMovieValidator(context));
               });
        }
    }
}
