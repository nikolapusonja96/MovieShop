using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly MovieContext _context;

        public EfDeleteUserCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 34;

        public string Name => "Delete User";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if(user == null)
            {
                throw new EntityNotFoundException(request, typeof(User));
            }

            user.IsActive = false;
            user.IsDeleted = true;
            user.DeletedAt = DateTime.Now;

            _context.SaveChanges();
        }
    }
}
