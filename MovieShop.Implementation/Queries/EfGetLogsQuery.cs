using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MovieShop.Implementation.Queries
{
    public class EfGetLogsQuery : IGetLogsQuery
    {
        private readonly MovieContext _context;

        public EfGetLogsQuery(MovieContext context)
        {
            _context = context;
        }

        public int Id => 38;

        public string Name => "Get Logs";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var query = _context.UseCaseLogs.AsQueryable();

            #region Filters
            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.UseCaseName.ToLower().Contains(search.Name.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.ActorName) || !string.IsNullOrWhiteSpace(search.ActorName))
            {
                query = query.Where(x => x.Actor.ToLower().Contains(search.ActorName.ToLower()));
            }

            if (search.MinDate != null)
            {
                query = query.Where(x => x.Date >= search.MinDate);
            }

            if (search.MaxDate != null)
            {
                query = query.Where(x => x.Date <= search.MaxDate);
            }

            if (search.Year != null)
            {
                query = query.Where(x => x.Date.Year == search.Year);
            }

            if (search.Month != null)
            {
                query = query.Where(x => x.Date.Month == search.Month);
            }

            if (search.Day != null)
            {
                query = query.Where(x => x.Date.Day == search.Day);
            } 
            #endregion

            var skipCount = search.PerPage * (search.Page - 1);

            var response = new PagedResponse<LogDto>
            {
                TotalCount = query.Count(),
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                Items = query.Skip(skipCount)
                             .Take(search.PerPage)
                             .Select(l => new LogDto
                             {
                                 Id = l.Id,
                                 Date = l.Date,
                                 UseCaseName = l.UseCaseName,
                                 Actor = l.Actor,
                                 Data = l.Data
                             })
            };

            return response;
        }
    }
}
