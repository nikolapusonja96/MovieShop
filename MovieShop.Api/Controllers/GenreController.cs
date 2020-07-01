using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.DataTransfer;
using MovieShop.Application.Exceptions;
using MovieShop.Application.Queries;
using MovieShop.Application.Searches;
using MovieShop.DataAccess;
using MovieShop.Domain;
using MovieShop.Implementation.Validators;

namespace MovieShop.Api.Controllers
{
    //[Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class GenreController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public GenreController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Genre
        [HttpGet]
        public IActionResult Get([FromQuery] GenreSearch search, [FromServices] IGetGenresQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Genre/5
        [HttpGet("{id}", Name = "GetGenre")]
        public IActionResult Get(int id, [FromServices] IGetSingleGenreQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Genre
        [Authorize]
        [HttpPost]
        public IActionResult Post(
            [FromBody] GenreDto dto,
            [FromServices] ICreateGenreCommand command)
        {
                _executor.ExecuteCommand(command, dto);
                return StatusCode(StatusCodes.Status201Created);  
        }

        // PUT: api/Genre/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id,
            [FromBody] GenreDto dto,
            [FromServices] IUpdateGenreCommand command)
        {
            dto.Id = id;
             
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteGenreCommand command)
        {
                _executor.ExecuteCommand(command, id);
                return StatusCode(StatusCodes.Status204NoContent);
            
        }
    }
}
