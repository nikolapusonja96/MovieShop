using FluentValidation;
using MovieShop.Application.DataTransfer;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Validators
{
    public class CreateMovieActorValidator : AbstractValidator<CreateMovieActorDto>
    {
        private readonly MovieContext _context;

        public CreateMovieActorValidator(MovieContext context)
        {
            _context = context;

            RuleFor(x => x.ActorId)
                .Must(ActorExists)
                .WithMessage("Actor with an id of {PropertyValue} does not exists in db")
                .DependentRules(() =>
                {
                    RuleFor(x => x.ActorCharacterName)
                    .NotEmpty()
                    .WithMessage("Actor character in movie can not be empty");
                });
        }

        private bool ActorExists(int actorId)
        {
            return _context.Actors.Any(x => x.Id == actorId);
        }
    }
   
    public class CreateMovieDirectorValidator : AbstractValidator<CreateMovieDirectorDto>
    {
        private readonly MovieContext _context;

        public CreateMovieDirectorValidator(MovieContext context)
        {
            _context = context;
            RuleFor(x => x.DirectorId)
                .Must(DirectorExists)
                .WithMessage("Director with an id of {PropertyValue} does not exists in db");
        }

        private bool DirectorExists(int directorId)
        {
            return _context.Directors.Any(x => x.Id == directorId);
        }
    }

    public class CreateMovieWriterValidator : AbstractValidator<CreateMovieWriterDto>
    {
        private readonly MovieContext _context;

        public CreateMovieWriterValidator(MovieContext context)
        {
            _context = context;
            RuleFor(x => x.WriterId)
              .Must(WriterExists)
              .WithMessage("Writer with an id of {PropertyValue} does not exists in db");
        }

        private bool WriterExists(int writerId)
        {
            return _context.Writers.Any(x => x.Id == writerId);
        }
    }
}
