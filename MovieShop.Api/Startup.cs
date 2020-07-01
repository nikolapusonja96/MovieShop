using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using MovieShop.Api.Core;
using MovieShop.Application;
using MovieShop.Application.Commands;
using MovieShop.Application.Email;
using MovieShop.Application.Queries;
using MovieShop.DataAccess;
using MovieShop.Implementation.Commands;
using MovieShop.Implementation.Email;
using MovieShop.Implementation.Logging;
using MovieShop.Implementation.Queries;
using MovieShop.Implementation.Validators;
using Newtonsoft.Json;

namespace MovieShop.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {

            services.AddTransient<MovieContext>();
            services.AddTransient<UseCaseExecutor>();
            services.AddTransient<IUseCaseLogger, DbUseCaseLogger>();
            services.AddTransient<IEmailSender, SmtpEmailSender>();
            services.AddAutoMapper(this.GetType().Assembly);
            services.AddUseCases();
            services.AddValidators();
            services.AddSwagger();
            services.AddHttpContextAccessor();
            services.AddApplicationActor();
            services.AddJwt();
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Swagger");
            });

            app.UseRouting();

            app.UseStaticFiles();
            
            app.UseAuthentication();

            app.UseAuthorization();

            app.UseMiddleware<GlobalExceptionHandler>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
