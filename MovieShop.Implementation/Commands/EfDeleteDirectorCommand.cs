using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteDirectorCommand : IDeleteDirectorCommand
    {
        private readonly MovieContext _context;

        public EfDeleteDirectorCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 17;

        public string Name => "Delete Director";

        public void Execute(int request)
        {
            var director = _context.Directors.Find(request);

            if (director == null)
            {
                throw new EntityNotFoundException(request, typeof(Director));
            }

            director.DeletedAt = DateTime.Now;
            director.IsDeleted = true;
            director.IsActive = false;

            _context.SaveChanges();
        }
    }
}
