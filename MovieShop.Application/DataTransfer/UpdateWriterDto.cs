using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class UpdateWriterDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string FullName => FirstName + " " + LastName;
        public int? Oscars { get; set; }
    }
}
