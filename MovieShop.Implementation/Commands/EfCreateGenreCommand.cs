using AutoMapper;
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
    public class EfCreateGenreCommand : ICreateGenreCommand
    {
        private readonly MovieContext _context;
        private readonly CreateGenreValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateGenreCommand(MovieContext context, CreateGenreValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Name => "Create new Genre";

        public void Execute(GenreDto request)
        {
            _validator.ValidateAndThrow(request); //ValidationException

           //var newGenre = _mapper.Map<Genre>(request);
            var newGenre = new Genre
            {
                Name = request.Name
            };

            _context.Genres.Add(newGenre);
            _context.SaveChanges();
        }
    }
}
