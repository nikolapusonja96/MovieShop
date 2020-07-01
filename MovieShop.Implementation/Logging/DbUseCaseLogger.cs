using MovieShop.Application;
using MovieShop.DataAccess;
using MovieShop.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Logging
{
    public class DbUseCaseLogger : IUseCaseLogger
    {
        private readonly MovieContext _context;

        public DbUseCaseLogger(MovieContext context)
        {
            _context = context;
        }

        public void Log(IUseCase useCase, IApplicationActor actor, object useCaseData)
        {
            _context.UseCaseLogs.Add(new UseCaseLog
            {
                Actor = actor.Identity,
                Date = DateTime.UtcNow,
                Data = JsonConvert.SerializeObject(useCaseData),
                UseCaseName = useCase.Name
            });

            _context.SaveChanges();
        }
    }
}
