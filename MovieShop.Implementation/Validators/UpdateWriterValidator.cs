using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UpdateWriterValidator : AbstractValidator<UpdateWriterDto>
    {
        public UpdateWriterValidator(MovieContext context)
        {
            RuleFor(x => x.FullName)
                .Must((dto, fullname) => !context.Writers.Any(w => w.Fullname == fullname && w.Id != dto.Id))
                .WithMessage(w => $"Writer ({w.FullName}) already exists in database");
        }
    }
}
