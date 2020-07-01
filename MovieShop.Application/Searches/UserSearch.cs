using MovieShop.Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Searches
{
    public class UserSearch : PagedSearch
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Role { get; set; }
        public int? MinOrders { get; set; }
    }
}
