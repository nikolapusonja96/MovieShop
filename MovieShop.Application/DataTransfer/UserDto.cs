using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.DataTransfer
{
    public class UserDto
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Fullname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public IEnumerable<UserUseCaseDto> AllowedUseCases { get; set; }
        public IEnumerable<OrderDto> Orders { get; set; }
    }

    public class UserUseCaseDto
    {
        public int UseCaseId { get; set; }
    }
}
