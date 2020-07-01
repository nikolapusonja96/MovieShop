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
    public class EfCreateActorCommand : ICreateActorCommand
    {

        private readonly MovieContext _context;
        private readonly CreateActorValidator _validator;

        public EfCreateActorCommand(MovieContext context, CreateActorValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 11;

        public string Name => "Create Actor";

        public void Execute(CreateActorDto request)
        {
            _validator.ValidateAndThrow(request);
            var actor = new Actor
            {
                 Id=request.Id,
                 FirstName = request.FirstName,
                 LastName = request.LastName,
                 FirstAndLastName = request.FullName,
                 BirthPlace = request.BirthPlace,
                 Age=request.Age,
                 Birth=request.Birth,
                 Oscars=request.Oscars,
                 MoviesNumber = request.MovieNumber
                 
            };

            //add into n:n
            foreach(var item in request.ActorMovies)
            {
                actor.ActorMovies.Add(new ActorMovie
                {
                    MovieId=item.MovieId,
                    ActorId =actor.Id,
                    ActorCharachterName=item.ActorCharacterName,
                    
                });
            }
            
            _context.Actors.Add(actor);
            _context.SaveChanges();
        }
    }
}

