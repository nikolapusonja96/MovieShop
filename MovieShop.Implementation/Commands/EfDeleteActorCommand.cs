using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteActorCommand : IDeleteActorCommand
    {
        private readonly MovieContext _context;

        public EfDeleteActorCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id =>12;

        public string Name => "Delete Actor";

        public void Execute(int request)
        {
            var actor = _context.Actors.Find(request);

            if (actor == null)
            {
                throw new EntityNotFoundException(request, typeof(Actor));
            }
            
             actor.DeletedAt = DateTime.Now;
             actor.IsDeleted = true;
             actor.IsActive = false;

             _context.SaveChanges();
        }
    }
}
