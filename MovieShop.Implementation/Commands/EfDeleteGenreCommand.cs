using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteGenreCommand : IDeleteGenreCommand
    {
        private readonly MovieContext _context;

        public EfDeleteGenreCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 2;

        public string Name => "Delete Genre";

        public void Execute(int request)
        {
            var genre = _context.Genres.Find(request);

            if(genre == null)
            {
                throw new EntityNotFoundException(request, typeof(Genre));
            }

            genre.DeletedAt = DateTime.Now;
            genre.IsDeleted = true;
            genre.IsActive = false;

            
            _context.SaveChanges();
                        
        }
    }
}
