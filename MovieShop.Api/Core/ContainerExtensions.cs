using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.Queries;
using MovieShop.DataAccess;
using MovieShop.Implementation.Commands;
using MovieShop.Implementation.Queries;
using MovieShop.Implementation.Validators;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MovieShop.Api.Core
{
    public static class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {
            #region Commands
            services.AddTransient<ICreateGenreCommand, EfCreateGenreCommand>();
            services.AddTransient<IDeleteGenreCommand, EfDeleteGenreCommand>();
            services.AddTransient<IUpdateGenreCommand, EfUpdateGenreCommand>();
            services.AddTransient<ICreateActorCommand, EfCreateActorCommand>();
            services.AddTransient<IDeleteActorCommand, EfDeleteActorCommand>();
            services.AddTransient<IUpdateActorCommand, EfUpdateActorCommand>();
            services.AddTransient<ICreateRoleCommand, EfCreateRoleCommand>();
            services.AddTransient<IDeleteRoleCommand, EfDeleteRoleCommand>();
            services.AddTransient<IUpdateRoleCommand, EfUpdateRoleCommand>();
            services.AddTransient<ICreateWriterCommand, EfCreateWriterCommand>();
            services.AddTransient<IDeleteWriterCommand, EfDeleteWriterCommand>();
            services.AddTransient<IUpdateWriterCommand, EfUpdateWriterCommand>();
            services.AddTransient<ICreateDirectorCommand, EfCreateDirectorCommand>();
            services.AddTransient<IDeleteDirectorCommand, EfDeleteDirectorCommand>();
            services.AddTransient<IUpdateDirectorCommand, EfUpdateDirectorCommand>();
            services.AddTransient<ICreateMovieCommand, EfCreateMovieCommand>();
            services.AddTransient<IUpdateMovieCommand, EfUpdateMovieCommand>();
            services.AddTransient<IDeleteMovieCommand, EfDeleteMovieCommand>();
            services.AddTransient<ICreateOrderCommand, EfCreateOrderCommand>();
            services.AddTransient<IUploadFileCommand, EfUploadFileCommand>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            #endregion

            #region Queries
            services.AddTransient<IGetGenresQuery, EfGetGenresQuery>();
            services.AddTransient<IGetSingleGenreQuery, EfGetSingleGenreQuery>();
            services.AddTransient<IGetRolesQuery, EfGetRolesQuery>();
            services.AddTransient<IGetSingleRoleQuery, EfGetSingleRoleQuery>();
            services.AddTransient<IGetActorsQuery, EfGetActorsQuery>();
            services.AddTransient<IGetSingleActorQuery, EfGetSingleActorQuery>();
            services.AddTransient<IGetWritersQuery, EfGetWritersQuery>();
            services.AddTransient<IGetSingleWriterQuery, EfGetSingleWriterQuery>();
            services.AddTransient<IGetDirectorsQuery, EfGetDirectorsQuery>();
            services.AddTransient<IGetSingleDirectorQuery, EfGetSingleDirectorQuery>();
            services.AddTransient<IGetMoviesQuery, EfGetMoviesQuery>();
            services.AddTransient<IGetSingleMovieQuery, EfGetSingleMovieQuery>();
            services.AddTransient<IGetOrdersQuery, EfGetOrdersQuery>();
            services.AddTransient<IGetSingleOrderQuery, EfGetSingleOrderQuery>();
            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetSingleUserQuery, EfGetSingleUserQuery>();
            services.AddTransient<IGetLogsQuery, EfGetLogsQuery>(); 
            #endregion
        }
        
        public static void AddValidators(this IServiceCollection services)
        {
            services.AddTransient<CreateGenreValidator>();
            services.AddTransient<UpdateGenreValidator>();
            services.AddTransient<CreateRoleValidator>();
            services.AddTransient<UpdateRoleValidator>();
            services.AddTransient<CreateActorValidator>();
            services.AddTransient<CreateActorMovieValidator>();
            services.AddTransient<UpdateActorValidator>();
            services.AddTransient<CreateWriterValidator>();
            services.AddTransient<CreateWriterMovieValidator>();
            services.AddTransient<UpdateWriterValidator>();
            services.AddTransient<CreateDirectorValidator>();
            services.AddTransient<CreateDirectorMovieValidator>();
            services.AddTransient<UpdateDirectorValidator>();
            services.AddTransient<CreateMovieValidator>();
            services.AddTransient<CreateMovieDirectorValidator>();
            services.AddTransient<CreateMovieWriterValidator>();
            services.AddTransient<CreateMovieActorValidator>();
            services.AddTransient<UpdateMovieValidator>();
            services.AddTransient<CreateOrderValidator>();
            services.AddTransient<CreateOrderLineValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<UploadFileValidator>();
        }

        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnonymousActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;
            });
        }

        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>();

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }

        public static void AddSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Movie Shop", Version = "v1" });
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                    Name = "Authorization",
                    In = ParameterLocation.Header,
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer"
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement()
                {
                    {
                        new OpenApiSecurityScheme
                          {
                            Reference = new OpenApiReference
                              {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                              },
                              Scheme = "oauth2",
                              Name = "Bearer",
                              In = ParameterLocation.Header,

                            },
                            new List<string>()
                          }
                    });
            });
        }
    }
}
