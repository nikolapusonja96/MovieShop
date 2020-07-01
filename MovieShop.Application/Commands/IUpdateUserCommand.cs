using MovieShop.Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Commands
{
    public interface IUpdateUserCommand : ICommand<UpdateUserDto>
    {
    }
}
