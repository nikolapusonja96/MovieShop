using Microsoft.EntityFrameworkCore;
using MovieShop.Application;
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
    public class EfGetSingleOrderQuery : IGetSingleOrderQuery
    {
        private readonly MovieContext _context;
        private readonly IApplicationActor _actor;
        public EfGetSingleOrderQuery(MovieContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 28;

        public string Name => "Get Single Order";

        public OrderDto Execute(int search)
        {
            var query = _context.Orders.Include(x => x.OrderLines)
                                       .Include(x => x.User)
                                       .AsQueryable();

            var order = query.FirstOrDefault(o => o.Id == search);

            if (order == null)
            {
                throw new EntityNotFoundException(search, typeof(Order));
            }

            if(order.UserId != _actor.Id)
            {
                throw new UnauthorizedUseCaseException(this, _actor);
            }

            var response = new OrderDto
            {
                Id = order.Id,
                Address = order.Address,
                CreatedAt = order.CreatedAt,
                UserFullname = order.User.Fullname,
                OrderLines = order.OrderLines.Select(ol => new OrderLineDto
                {
                    Id = ol.Id,
                    Price = ol.Price,
                    Quantity = ol.Quantity,
                    Title = ol.Title
                })
            };

            return response;
        }
    }
}
