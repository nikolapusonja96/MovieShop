using FluentValidation;
using Microsoft.EntityFrameworkCore.Internal;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(MovieContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("First name cannot be empty");
            
            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Last name cannot be empty");

            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(4)
                .WithMessage("Password cannot be empty and must have at least 4 characters");

            RuleFor(x => x.Username)
                .NotEmpty()
                .MinimumLength(4)
                .Must(x => !context.Users.Any(user => user.Username == x))
                .WithMessage("Username is already taken.");
            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress()
                .Must(x => !context.Users.Any(email => email.Email == x))
                .WithMessage("Email is already in use");
                
        }
    }
}
