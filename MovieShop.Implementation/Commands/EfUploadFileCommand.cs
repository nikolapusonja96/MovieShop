using FluentValidation;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Implementation.Validators;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace MovieShop.Implementation.Commands
{
    public class EfUploadFileCommand : IUploadFileCommand
    {
        private readonly UploadFileValidator _validator;

        public EfUploadFileCommand(UploadFileValidator validator)
        {
            _validator = validator;
        }

        public int Id => 40;

        public string Name => "Upload File";

        public void Execute(UploadFileDto request)
        {
            _validator.ValidateAndThrow(request);
            
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(request.Image.FileName);

            var newFileName = guid + extension; 

            var path = Path.Combine("wwwroot", "images", newFileName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                request.Image.CopyTo(fileStream);
            }
        }
    }
}
