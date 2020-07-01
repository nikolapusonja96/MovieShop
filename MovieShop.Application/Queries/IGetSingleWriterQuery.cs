using MovieShop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Queries
{
    public interface IGetSingleWriterQuery : IQuery<int, WriterDto>
    {
    }
}
