using AutoMapper;
using MovieShop.Application.DataTransfer;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.Implementation.Profiles
{
    public class GenreProfile : Profile
    {
        public GenreProfile()
        {
            CreateMap<Genre, GenreDto>();  
        }
    }
}
