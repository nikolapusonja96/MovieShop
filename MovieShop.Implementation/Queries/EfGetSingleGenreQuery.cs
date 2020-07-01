using AutoMapper;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.Application.Queries;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetSingleGenreQuery : IGetSingleGenreQuery
    {
        private readonly MovieContext _context;
        private readonly IMapper _mapper;
        public EfGetSingleGenreQuery(MovieContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 5;

        public string Name => "Get Single Genre";

        public GenreDto Execute(int search)
        {
            var genre = _context.Genres.FirstOrDefault(g=>g.Id == search);

            if (genre == null)
            {
                throw new EntityNotFoundException(search, typeof(Genre));
            }

           // var response = _mapper.Map<GenreDto>(genre);

            var response = new GenreDto
            {
                Id = genre.Id,
                Name = genre.Name
            };
            return response;
        }
    }
}
