using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Queries
{
    public class PagedResponse<T> where T : class 
    {
        public int TotalCount { get; set; } //number in db
        public int CurrentPage { get; set; }
        public int ItemsPerPage { get; set; }
        public int PagesCount => (int)Math.Ceiling((float)TotalCount / ItemsPerPage);
        public IEnumerable<T> Items { get; set; }
    }
}
