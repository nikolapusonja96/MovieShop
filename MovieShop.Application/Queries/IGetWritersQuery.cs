using MovieShop.Application.DataTransfer;
using MovieShop.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Queries
{
    public interface IGetWritersQuery : IQuery<WriterSearch, PagedResponse<WriterDto>>
    {
    }
}
