using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Email;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly MovieContext _context;
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public EfRegisterUserCommand(MovieContext context, RegisterUserValidator validator, IEmailSender sender)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
        }

        public int Id => 39;

        public string Name => "User Registration";

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Fullname = request.FirstName + " " + request.LastName,
                Username = request.Username,
                Password = request.Password,
                RoleId = 2,
                Email = request.Email
            };

            _context.Users.Add(user);
            
            var useCases = new List<UserUseCase>();
            var newUseCases = new List<int> { 4, 5, 9, 10, 14, 15, 19, 20, 24, 25, 26, 28, 35, 37 }; //ono sta sme ulogovani
            
            foreach(var useCase in newUseCases)
            {
                var userUseCases = new UserUseCase
                {
                    UserId = user.Id,
                    UseCaseId = useCase
                };
                useCases.Add(userUseCases);
            }

            user.UserUseCases = useCases;
            
            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                Subject = "Registration",
                Content = "<h1>Successfull registration, you can use your username and password to log in</h1>",
                SendTo = request.Email
            });
        }
    }
}
