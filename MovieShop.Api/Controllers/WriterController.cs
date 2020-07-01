using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;

namespace MovieShop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WriterController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public WriterController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Writer
        [HttpGet]
        public IActionResult Get([FromQuery] WriterSearch search, [FromServices] IGetWritersQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }
        
        // GET: api/Writer/5
        [HttpGet("{id}", Name = "GetWriter")]
        public IActionResult Get(int id, [FromServices] IGetSingleWriterQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Writer
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateWriterDto dto,
            [FromServices] ICreateWriterCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Writer/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateWriterDto dto, [FromServices] IUpdateWriterCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }


        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteWriterCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
