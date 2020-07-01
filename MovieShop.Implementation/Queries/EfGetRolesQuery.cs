using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetRolesQuery : IGetRolesQuery
    {
        private readonly MovieContext _context;

        public EfGetRolesQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 32;

        public string Name => "Get Roles";

        public PagedResponse<RoleDto> Execute(RoleSearch search)
        {
            var query = _context.Roles.AsQueryable();
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.Name.ToLower().Contains(search.Name.ToLower()));
            }
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<RoleDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(x => new RoleDto
                             {
                                 Id = x.Id,
                                 Name = x.Name
                             }).ToList()
            };
            return response;
        }
    }
}
