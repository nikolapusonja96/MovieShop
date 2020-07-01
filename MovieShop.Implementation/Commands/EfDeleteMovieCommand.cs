using MovieShop.Application.Commands;
using MovieShop.Application.Exceptions;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfDeleteMovieCommand : IDeleteMovieCommand
    {
        private readonly MovieContext _context;

        public EfDeleteMovieCommand(MovieContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "Delete Movie";

        public void Execute(int request)
        {
            var movie = _context.Movies.Find(request);

            if (movie == null)
            {
                throw new EntityNotFoundException(request, typeof(Movie));
            }

            movie.DeletedAt = DateTime.Now;
            movie.IsDeleted = true;
            movie.IsActive = false;

            _context.SaveChanges();
        }
    }
}
