using FluentValidation;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfUpdateUserCommand : IUpdateUserCommand
    {
        private readonly MovieContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IApplicationActor _actor;

        public EfUpdateUserCommand(MovieContext context, UpdateUserValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => 35;

        public string Name => "Update User";

        public void Execute(UpdateUserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = _context.Users.Find(request.Id);

            if(user == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(User));
            }

            if(user.Id != _actor.Id)
            {
               throw new UnauthorizedUseCaseException(this, _actor);
            }

            if(request.FirstName == null && request.LastName == null)
            {
                request.FirstName = user.FirstName;
                request.LastName = user.LastName;
            }
            if(request.FirstName == null && request.LastName != null)
            {
                request.FirstName = user.FirstName;
            }
            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = user.LastName;
            }

            if (request.Password == null)
            {
                request.Password = user.Password;
            }
            if(request.Email == null)
            {
                request.Email = user.Email;
            }


            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Password = request.Password;
            user.Email = request.Email;
            user.Fullname = request.Fullname;

           
            _context.SaveChanges();
        }
    }
}
