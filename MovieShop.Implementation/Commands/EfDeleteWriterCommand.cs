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
    public class EfDeleteWriterCommand : IDeleteWriterCommand
    {
        private readonly MovieContext _context;

        public EfDeleteWriterCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 7;

        public string Name =>"Delete Writer";

        public void Execute(int request)
        {
            var writer = _context.Writers.Find(request);

            if (writer == null)
            {
                throw new EntityNotFoundException(request, typeof(Writer));
            }

            writer.DeletedAt = DateTime.Now;
            writer.IsDeleted = true;
            writer.IsActive = false;

            _context.SaveChanges();
        }
    }
}
