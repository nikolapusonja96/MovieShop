using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfCreateRoleCommand : ICreateRoleCommand
    {
        private readonly MovieContext _context;
        private readonly CreateRoleValidator _validator;

        public EfCreateRoleCommand(MovieContext context, CreateRoleValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 29;

        public string Name => "Create Role";

        public void Execute(RoleDto request)
        {
            _validator.ValidateAndThrow(request);
            
            var newRole = new Role
            {
                Name = request.Name
            };

            _context.Roles.Add(newRole);
            _context.SaveChanges();
        }
        
    }
}
