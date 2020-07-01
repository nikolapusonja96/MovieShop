using Microsoft.EntityFrameworkCore;
using MovieShop.DataAccess.Configuration;
using MovieShop.Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace MovieShop.DataAccess
{
    public class MovieContext : DbContext
    {
        public override int SaveChanges()
        {
            var entries = ChangeTracker.Entries();

            foreach (var entry in entries)
            {
                if (entry.Entity is BaseEntity entity)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            entity.CreatedAt = DateTime.Now;
                            entity.IsActive = true;
                            entity.IsDeleted = false;
                            entity.ModifiedAt = null;
                            entity.DeletedAt = null;
                            break;

                        case EntityState.Modified:
                           
                            entity.ModifiedAt = DateTime.Now;
                            break;
                    }
                }
            }
            return base.SaveChanges();
           
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Movie>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<User>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Writer>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Director>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Actor>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Genre>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Role>().HasQueryFilter(x => !x.IsDeleted);
            modelBuilder.Entity<Order>().HasQueryFilter(x => !x.IsDeleted);

            //applying configuration
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new RoleConfiguration());
            modelBuilder.ApplyConfiguration(new MovieConfiguration());
            modelBuilder.ApplyConfiguration(new GenreConfiguration());
            modelBuilder.ApplyConfiguration(new ActorConfiguration());
            modelBuilder.ApplyConfiguration(new DirectorConfiguration());
            modelBuilder.ApplyConfiguration(new WriterConfiguration());
            modelBuilder.ApplyConfiguration(new OrderConfiguration());
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=MovieShop;Integrated Security=True");
        }

        public DbSet<Role> Roles { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Movie> Movies { get; set; }
        public DbSet<Genre> Genres { get; set; }
        public DbSet<Actor> Actors { get; set; }
        public DbSet<ActorMovie> ActorMovie { get; set; }
        public DbSet<Director> Directors { get; set; }
        public DbSet<DirectorMovie> DirectorMovie { get; set; }
        public DbSet<Writer> Writers { get; set; }
        public DbSet<WriterMovie> WriterMovie { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderLine> OrderLine { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
    }
}
