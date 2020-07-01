using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class UploadFileDto
    {
        public IFormFile Image { get; set; }
    }
}
