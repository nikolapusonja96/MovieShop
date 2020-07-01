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
using MovieShop.DataAccess;

namespace MovieShop.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ActorController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public ActorController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Actor
        [HttpGet]
        public IActionResult Get([FromQuery] ActorSearch search, [FromServices] IGetActorsQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);   
            return Ok(result);
        }
        

        // GET: api/Actor/5
        [HttpGet("{id}", Name = "GetActor")]
        public IActionResult Get(int id, [FromServices] IGetSingleActorQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Actor
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateActorDto dto, [FromServices] ICreateActorCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Actor/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateActorDto dto, [FromServices] IUpdateActorCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteActorCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
