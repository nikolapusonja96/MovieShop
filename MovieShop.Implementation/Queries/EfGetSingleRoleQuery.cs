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
    public class EfGetSingleRoleQuery : IGetSingleRoleQuery
    {
        private readonly MovieContext _context;

        public EfGetSingleRoleQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 33;

        public string Name => "Get One Role";

        public RoleDto Execute(int search)
        {
            var genre = _context.Roles.FirstOrDefault(g => g.Id == search);

            if (genre == null)
            {
                throw new EntityNotFoundException(search, typeof(Role));
            }

            var response = new RoleDto
            {
                Id = genre.Id,
                Name = genre.Name
            };
            return response;
        }
    }
}
