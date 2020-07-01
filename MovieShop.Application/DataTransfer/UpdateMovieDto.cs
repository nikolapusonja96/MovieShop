using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class UpdateMovieDto
    {
        public int Id { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public decimal? Budget { get; set; }
        public int? Oscars { get; set; }
        public int? Year { get; set; }
    }
}
