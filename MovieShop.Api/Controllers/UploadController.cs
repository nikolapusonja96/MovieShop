using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;

namespace MovieShop.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UploadController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // POST: api/Upload
        [HttpPost]
        public void Post([FromForm] UploadFileDto dto, [FromServices] IUploadFileCommand command)
        {
            _executor.ExecuteCommand(command, dto);
        }
    }
}
