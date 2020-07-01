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
    public class MovieController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public MovieController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Movie
        [HttpGet]
        public IActionResult Get([FromQuery] MovieSearch search, [FromServices] IGetMoviesQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Movie/5
        [HttpGet("{id}", Name = "GetMovie")]
        public IActionResult Get(int id, [FromServices] IGetSingleMovieQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Movie
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromBody] CreateMovieDto dto, [FromServices] ICreateMovieCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Movie/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UpdateMovieDto dto, [FromServices] IUpdateMovieCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);
            return NoContent();
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteMovieCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
