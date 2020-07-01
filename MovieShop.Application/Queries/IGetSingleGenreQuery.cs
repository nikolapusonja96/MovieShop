using MovieShop.Application.DataTransfer;
using MovieShop.Application.Searches;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Queries
{
    public interface IGetSingleGenreQuery : IQuery<int, GenreDto>
    {
    }
}
