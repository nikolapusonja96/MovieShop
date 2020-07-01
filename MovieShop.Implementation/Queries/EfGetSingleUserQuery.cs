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
    public class EfGetSingleUserQuery : IGetSingleUserQuery
    {
        private readonly MovieContext _context;
        private readonly IApplicationActor _actor;
        public EfGetSingleUserQuery(MovieContext context, IApplicationActor actor)
        {
            _context = context;
            _actor = actor;
        }

        public int Id => 37;

        public string Name => "Get single User";

        public UserDto Execute(int search)
        {
            var query = _context.Users.Include(x => x.Role)
                                      .Include(x => x.Orders)
                                      .ThenInclude(x => x.OrderLines)
                                      .Include(x => x.UserUseCases)
                                      .AsQueryable();

            var user = query.FirstOrDefault(o => o.Id == search);

            if (user == null)
            {
                throw new EntityNotFoundException(search, typeof(User));
            }

            if(user.Id != _actor.Id)
            {
                throw new UnauthorizedUseCaseException(this, _actor);
            }
            

            var response = new UserDto
            {
                Id = user.Id,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Fullname = user.Fullname,
                Email = user.Email,
                Username = user.Username,
                Password = user.Password,
                Role = user.Role.Name,
                AllowedUseCases = user.UserUseCases.Select(uc => new UserUseCaseDto
                {
                    UseCaseId = uc.UseCaseId
                }),
                Orders = user.Orders.Select(o => new OrderDto
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
