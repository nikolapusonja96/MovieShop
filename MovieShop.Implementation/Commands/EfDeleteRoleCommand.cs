using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteRoleCommand : IDeleteRoleCommand
    {
        private readonly MovieContext _context;

        public EfDeleteRoleCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 30;

        public string Name => "Delete Role";

        public void Execute(int request)
        {
            var role = _context.Roles.Find(request);
            if (role == null)
            {
                throw new EntityNotFoundException(request, typeof(Role));
            }
            role.DeletedAt = DateTime.Now;
            role.IsDeleted = true;
            role.IsActive = false;


            _context.SaveChanges();
        }
    }
}
