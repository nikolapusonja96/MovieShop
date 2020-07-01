using AutoMapper;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetGenresQuery : IGetGenresQuery
    {
        private readonly MovieContext _context;
        private readonly IMapper _mapper;
        public EfGetGenresQuery(MovieContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 4;

        public string Name => "Get Genres";

        public PagedResponse<GenreDto> Execute(GenreSearch search)
        {
            var query = _context.Genres.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);

            //var response = _mapper.Map<PagedResponse<GenreDto>>(query);
           
            var response = new PagedResponse<GenreDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(x => new GenreDto
                             {
                                 Id = x.Id,
                                 Name = x.Name
                             }).ToList()
            };
            return response;
        }
    }
}