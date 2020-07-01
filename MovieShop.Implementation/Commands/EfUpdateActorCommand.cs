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
    public class EfUpdateActorCommand : IUpdateActorCommand
    {
        private readonly UpdateActorValidator _validator;
        private readonly MovieContext _context;

        public EfUpdateActorCommand(UpdateActorValidator validator, MovieContext context)
        {
            _validator = validator;
            _context = context;
        }

        public int Id => 13;

        public string Name => "Update Actor";

        public void Execute(UpdateActorDto request)
        {
            _validator.ValidateAndThrow(request);

            var actor = _context.Actors.Find(request.Id);

            if(actor == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Actor));
            }

            
            if(request.FirstName == null && request.LastName == null)
            {
                request.FirstName = actor.FirstName;
                request.LastName = actor.LastName;
            }

            if(request.FirstName == null && request.LastName != null)
            {
                request.FirstName = actor.FirstName;
            }

            if (request.FirstName != null && request.LastName == null)
            {
                request.LastName = actor.LastName;
            }
            
            var birthPlace = actor.BirthPlace;
            var oscars = actor.Oscars;

            actor.LastName = request.LastName;
            actor.FirstName = request.FirstName;
            actor.FirstAndLastName = request.FullName;
            actor.Oscars = request.Oscars ?? oscars;
            actor.BirthPlace = request.BirthPlace ?? birthPlace;

            _context.SaveChanges();
        }
    }
}
