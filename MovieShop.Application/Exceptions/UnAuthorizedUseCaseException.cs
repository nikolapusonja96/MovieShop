using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            : base($"actor with an id of {actor.Id} - {actor.Identity} tried to execute {useCase.Name}")
        {

        }
    }
}
