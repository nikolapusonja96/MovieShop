using Microsoft.EntityFrameworkCore;
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
    public class EfGetUsersQuery : IGetUsersQuery
    {
        private readonly MovieContext _context;

        public EfGetUsersQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 36;

        public string Name => "Get Users";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var query = _context.Users.Include(x => x.Role)
                                      .Include(x => x.Orders)
                                      .ThenInclude(x => x.OrderLines)
                                      .Include(x => x.UserUseCases)
                                      .AsQueryable();

            #region Filters
            if (!string.IsNullOrEmpty(search.FirstName) || !string.IsNullOrWhiteSpace(search.FirstName))
            {
                query = query.Where(x => x.FirstName.ToLower().Contains(search.FirstName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.LastName) || !string.IsNullOrWhiteSpace(search.LastName))
            {
                query = query.Where(x => x.LastName.ToLower().Contains(search.LastName.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                query = query.Where(x => x.Username.ToLower().Contains(search.Username.ToLower()));
            }
            if (!string.IsNullOrEmpty(search.Role) || !string.IsNullOrWhiteSpace(search.Role))
            {
                query = query.Where(x => x.Role.Name.ToLower().Contains(search.Role.ToLower()));
            }
            if(search.MinOrders != null)
            {
                query = query.Where(x => x.Orders.Count() >= search.MinOrders);
            }
            #endregion

            var skipCount = search.PerPage * (search.Page - 1);
            var response = new PagedResponse<UserDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(u => new UserDto
                             {
                                 Id = u.Id,
                                 FirstName = u.FirstName,
                                 LastName = u.LastName,
                                 Fullname = u.Fullname,
                                 Email = u.Email,
                                 Username = u.Username,
                                 Password = u.Password,
                                 Role = u.Role.Name,
                                 AllowedUseCases = u.UserUseCases.Select(uc => new UserUseCaseDto
                                 {
                                     UseCaseId = uc.UseCaseId
                                 }),
                                 Orders = u.Orders.Select(o => new OrderDto
                                 {
                                     Id = o.Id,
                                     Address = o.Address,
                                     CreatedAt = o.CreatedAt,
                                     UserFullname = o.User.Fullname,
                                     OrderLines = o.OrderLines.Select(ol => new OrderLineDto
                                     {
                                         Id = ol.Id,
                                         Price = ol.Price,
                                         Quantity = ol.Quantity,
                                         Title = ol.Title
                                     })
                                 })
                             })
            };
            return response;
        }
    }
}
