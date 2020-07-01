using FluentValidation;
using MovieShop.Application;
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
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly MovieContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IApplicationActor _actor;

        public EfCreateOrderCommand(MovieContext context, CreateOrderValidator validator, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _actor = actor;
        }

        public int Id => 26;

        public string Name => "Create Order";

        public void Execute(CreateOrderDto request)
        {
            _validator.ValidateAndThrow(request);

            var order = new Order
            {
                Address = request.Address,
                UserId = _actor.Id,
                OrderDate = request.OrderDate
            };

            foreach(var item in request.Items)
            {
                var movie = _context.Movies.Find(item.MovieId);
                movie.Quantity -= item.Quantity;

                order.OrderLines.Add(new OrderLine
                {
                    MovieId = item.MovieId,
                    Quantity = item.Quantity,
                    Title = movie.Title,
                    Price = movie.Price,
                    OrderId = order.Id
                });
            }

            _context.Orders.Add(order);
            _context.SaveChanges();
        }
    }
}
