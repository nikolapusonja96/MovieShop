using MovieShop.Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MovieShop.Api.Core
{
    public class AnonymousActor : IApplicationActor
    {
        public int Id => 0;

        public string Identity => "Anonymus user";

        public IEnumerable<int> AllowedUseCases => new List<int> { 4, 5, 9, 10, 14, 15, 19, 20, 24, 25, 39 };
    }
}
