using FluentValidation;
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
    public class EfUpdateRoleCommand : IUpdateRoleCommand
    {
        private readonly UpdateRoleValidator _validator;
        private readonly MovieContext _context;

        public EfUpdateRoleCommand(UpdateRoleValidator validator, MovieContext context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id => 31;

        public string Name => "Update Role";

        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);

            var role = _context.Roles.Find(request.Id);
            if (role == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Role));
            }
            role.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
