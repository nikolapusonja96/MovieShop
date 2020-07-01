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
    public class RoleController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public RoleController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Role
        [HttpGet]
        public IActionResult Get([FromQuery] RoleSearch search, [FromServices] IGetRolesQuery query)
        {
            var result = _executor.ExecuteQuery(query, search);
            return Ok(result);
        }

        // GET: api/Role/5
        [HttpGet("{id}", Name = "GetRole")]
        public IActionResult Get(int id, [FromServices] IGetSingleRoleQuery query)
        {
            var result = _executor.ExecuteQuery(query, id);
            return Ok(result);
        }

        // POST: api/Role
        [Authorize]
        [HttpPost]
        public IActionResult Post(
            [FromBody] RoleDto dto,
            [FromServices] ICreateRoleCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status201Created);
        }


        // PUT: api/Role/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] RoleDto dto, [FromServices] IUpdateRoleCommand command)
        {
            dto.Id = id;

            _executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteRoleCommand command)
        {
            _executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
