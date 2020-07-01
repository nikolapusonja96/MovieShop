using FluentValidation;
using MovieShop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class UploadFileValidator : AbstractValidator<UploadFileDto>
    {
        public UploadFileValidator()
        {
            RuleFor(x => x.Image)
                .NotEmpty()
                .WithMessage("Please select the file, it cannot be empty");
        }
    }
}
