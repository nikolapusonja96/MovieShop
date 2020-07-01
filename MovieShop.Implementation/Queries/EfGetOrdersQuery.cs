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
    public class EfGetOrdersQuery : IGetOrdersQuery
    {
        private readonly MovieContext _context;

        public EfGetOrdersQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 27;

        public string Name => "Get Orders";

        public PagedResponse<OrderDto> Execute(OrderSearch search)
        {
            var query = _context.Orders.Include(x => x.OrderLines)
                                       .Include(x => x.User)
                                        .AsQueryable();

            #region Filters
            if (search.MinOrderLines != null)
            {
                query = query.Where(o => o.OrderLines.Count() >= search.MinOrderLines);
            }
            if (search.Date != null)
            {
                query = query.Where(x => x.OrderDate == search.Date);
            }
            
            if (search.MinPrice !=null)
            {
                query = query.Where(o => o.OrderLines.Sum(ol => ol.Price * ol.Quantity) >= search.MinPrice);
            }
            if (search.MaxPrice != null)
            {
                query = query.Where(o => o.OrderLines.Sum(ol => ol.Price * ol.Quantity) <= search.MaxPrice);
            }

            if (search.userId != null)
            {
                query = query.Where(o => o.UserId == search.userId);
            }
            #endregion
            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<OrderDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(o => new OrderDto
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
            };

            return response;
        }
    }
}
